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
          case @message
          when '使い方'
            message = Linebot.first_reply
            client.reply_message(event['replyToken'], message)
          when '登録'
            message = Linebot.register_reply
            client.reply_message(event['replyToken'], message)
          when 'コミュニティURL登録送信'
            message = Linebot.register_reply
            client.reply_message(event['replyToken'], message)
          when '検索'
            message = Linebot.category_first_reply
            client.reply_message(event['replyToken'], message)
          when '地域', '趣味', '年齢', '性別', '職業'
            message = Linebot.category_second_reply(@message)
            client.reply_message(event['replyToken'], message)
          when '実行'
            message = Linebot.search_execute_reply
            client.reply_message(event['replyToken'], message)
          when 'ランダム'
            communities = Community.all.sample(3)
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
            client.reply_message(event['replyToken'], [message1, message2, message3])
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
end
