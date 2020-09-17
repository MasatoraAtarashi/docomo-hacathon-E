class Linebot < ApplicationRecord
  def self.first_reply
    { "type": "text",
      "text": "どんなコミュニティに参加しますか？",
      "quickReply": {
        "items":
        [
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "ガーデニング",
            "text": "ガーデニング"
            }
          },
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "料理",
            "text": "料理"
            }
          },
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "主婦",
            "text": "主婦"
            }
          },
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "子育て",
            "text": "子育て"
            }
          },
        ]
      }
    }
  end
end
