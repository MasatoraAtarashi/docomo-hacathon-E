class LinebotController < ApplicationController
  require 'line/bot'  # gem 'line-bot-api'

  # callbackアクションのCSRFトークン認証を無効
  protect_from_forgery except: [:callback]

  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = Rails.application.credentials.linebot[:channel_secret]
      config.channel_token = Rails.application.credentials.linebot[:channel_token]
    end
  end

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    head :bad_request unless client.validate_signature(body, signature)

    events = client.parse_events_from(body)

    events.each do |event|
      @message = event.message['text'].delete(' ') if event.message['text']
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          # Category.where.not(ancestor_id: nil).pluck(:name)毎回クエリ発行すると遅い
          second_categories = ["九州", "中国四国", "近畿", "中部", "関東", "東北北海道", "料理", "ハンドメイド", "ゲーム", "音楽", "アウトドア", "旅行", "スポーツ", "その他", "20代中心", "30代中心", "40代中心", "その他", "男性中心", "女性中心", "営業", "教育", "コンサル", "ITエンジニア", "クリエイティブ"]
          case @message
          when '使い方'
            message = Linebot.first_reply
            client.reply_message(event['replyToken'], message)
          when '登録'
            # message = Linebot.register_reply
            client.reply_message(event['replyToken'], template)
          when 'コミュニティURL登録送信'
            message = Linebot.register_reply
            client.reply_message(event['replyToken'], message)
          when '検索'
            message = Linebot.category_first_reply
            client.reply_message(event['replyToken'], message)
          when '地域', '趣味', '年齢', '性別', '職業'
            message = Linebot.category_second_reply(@message)
            client.reply_message(event['replyToken'], message)
          when *second_categories
            category_id = Category.find_by(name: @message)
            community_ids = CommunityCategory.where(category_id: category_id).pluck(:community_id)
            message0 = {
              "type": 'text',
              "text": "おすすめのコミュニティ"
            }
            messages = [message0]
            community_ids.each do |id|
              community = Community.find(id)
              messages << {
                "type": 'text',
                "text": "#{community.name}\n#{community.url}"
              }
            end
            client.reply_message(event['replyToken'], messages)
          when 'ランダム'
            communities = Community.all.sample(3)
            message0 = {
              "type": 'text',
              "text": "おすすめのコミュニティ"
            }
            message1 = {
              "type": 'text',
              "text": "#{communities[0].name}\n#{communities[0].url}"
            }
            message2 = {
              "type": 'text',
              "text": "#{communities[1].name}\n#{communities[1].url}"
            }
            message3 = {
              "type": 'text',
              "text": "#{communities[2].name}\n#{communities[2].url}"
            }
            client.reply_message(event['replyToken'], [message0, message1, message2, message3])
          when 'ガーデニング', '料理', '子育て', '主婦'
            message = {
              "type": 'text',
              "text": "コミュニティ名: #{Community.first.name}\nurl: #{Community.first.url}"
            }
            client.reply_message(event['replyToken'], message)
          else
            message = Linebot.first_reply
            client.reply_message(event['replyToken'], message)
          end
        else
          message = Linebot.first_reply
          client.reply_message(event['replyToken'], message)
        end
      end
    end

    head :ok
  end

  def template
    {
      "type": "template",
      "altText": "アクセス中",
      "template": {
          "type": "buttons",
          "title": "コミュニティ登録",
          "text": "コミュニティを登録しますか？",
          "actions": [
              {
                "type": "uri",
                "label": "登録する",
                "uri": "https://f26fda31f073.ngrok.io/communities/new"
              }
          ]
      }
    }
  end
end
