class Linebot < ApplicationRecord

  def self.first_reply
    { 
      "type": "text",
      "text": "こんにちは！OOO（サービス名）です！\n条件にあったコミュニティを検索できます。\n使い方を見る時は「使い方」\n検索を開始する時に「検索」\n自分のコミュニティを登録したいときは「登録」をタップしてください！",
      "quickReply": {
        "items":
        [
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "使い方",
            "text": "使い方"
            }
          },
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "検索",
            "text": "検索"
            }
          },
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "登録",
            "text": "登録"
            }
          },
        ]
      }
    }
  end

  def self.category_first_reply
    { 
      "type": "text",
      "text": "大カテゴリを選んでください。ランダムなコミュニティに参加したい場合は「ランダム」と送信してください",
      "quickReply": {
        "items":
        [
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "場所",
            "text": "場所"
            }
          },
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "趣味",
            "text": "趣味"
            }
          },
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "年齢",
            "text": "年齢"
            }
          },
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "性別",
            "text": "性別"
            }
          },
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "職業",
            "text": "職業"
            }
          },
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "ランダム",
            "text": "ランダム"
            }
          },
        ]
      }
    }
  end

  def self.register_reply
    {
      "type": "text",
      "text": "登録したいURLを入力してください",
      "quickReply": {
        "items":
        [
          {
            "type": "action",
            "action": {
            "type": "message",
            "label": "送信",
            "text": "コミュニティURL登録送信"
            }
          },
        ]
      }
    }
  end

  def self.search_reply
    { "type": "text",
      "text": "コミュニティを探します。\n最大3つまでの条件で検索できます。どの条件で検索しますか？\n違う条件で検索したい場合は「再検索」と送信してください",
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
            "label": "再検索",
            "text": "再検索"
            }
          },
        ]
      }
    }
  end

  def self.commnunity_reply
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
