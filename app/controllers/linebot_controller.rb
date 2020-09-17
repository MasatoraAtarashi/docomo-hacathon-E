class LinebotController < ApplicationController
  require 'line/bot'  # gem 'line-bot-api'

  # callbackアクションのCSRFトークン認証を無効
  protect_from_forgery :except => [:callback]

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = 'eae8b6c8071d67d852b3baf476f4aa40'
      config.channel_token = 'cBPBSI2kr5jnQp9v+gRTPef0VvQtSYo5pvGO03yVSzWg+OXjWD78Ow3zd1Pa45DqMhKoa4xNYxAcbJOvJiBFNTeb3i35KmsBxvTuqbM+k5mtk9ECNIygK2o2i9jlceqe7kYr5GOn9DiIScazrjexBwdB04t89/1O/w1cDnyilFU='
    }
  end

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head :bad_request
    end

    events = client.parse_events_from(body)

    events.each { |event|
      @message = event.message['text'].gsub(" ", "") 
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          case @message
          when "ガーデニング"
            message = {
              type: 'text',
              text: Community.first.url
            }
            client.reply_message(event['replyToken'], message)
          when "料理"
            message = {
              type: 'text',
              text: Community.first.url
            }
            client.reply_message(event['replyToken'], message)
          when "主婦"
            message = {
              type: 'text',
              text: Community.first.url
            }
            client.reply_message(event['replyToken'], message)
          when "子育て"
            message = {
              type: 'text',
              text: Community.first.url
            }
            client.reply_message(event['replyToken'], message)
          else
            message = Linebot.first_reply
            client.reply_message(event['replyToken'], message)
          end
        end
      end
    }

    head :ok
  end
end
