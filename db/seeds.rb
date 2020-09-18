community = Community.create(
  name: '主婦コミュニティ', 
  url: 'https://discord.gg/uYebc84', 
  picture: 'https://bit.ly/2ZKrmQg'
)
fishing_community = Community.create(
  name: '釣りコミュニティ', 
  url: 'https://discord.gg/uYebc84', 
  picture: 'https://bit.ly/32DAPe3'
)
study_community = Community.create(
  name: '勉強会コミュニティ', 
  url: 'https://discord.gg/uYebc84', 
  picture: 'https://bit.ly/35L30K1'
)
c1 = Category.create(name: '地域')

kyusyu = Category.create(name: '九州', ancestor_id: c1.id)
tyugoku = Category.create(name: '中国四国', ancestor_id: c1.id)
Category.create(name: '近畿', ancestor_id: c1.id)
Category.create(name: '中部', ancestor_id: c1.id)
kanto = Category.create(name: '関東', ancestor_id: c1.id)
Category.create(name: '東北北海道', ancestor_id: c1.id)

c2 = Category.create(name: '趣味')

ryori = Category.create(name: '料理', ancestor_id: c2.id)
Category.create(name: 'ハンドメイド', ancestor_id: c2.id)
Category.create(name: 'ゲーム', ancestor_id: c2.id)
Category.create(name: '音楽', ancestor_id: c2.id)
outdoor = Category.create(name: 'アウトドア', ancestor_id: c2.id)
Category.create(name: '旅行', ancestor_id: c2.id)
Category.create(name: 'スポーツ', ancestor_id: c2.id)
Category.create(name: 'その他', ancestor_id: c2.id)

c3 = Category.create(name: '年齢')
niju = Category.create(name: '20代中心', ancestor_id: c3.id)
sanju = Category.create(name: '30代中心', ancestor_id: c3.id)
yonju = Category.create(name: '40代中心', ancestor_id: c3.id)
Category.create(name: 'その他', ancestor_id: c3.id)

c4 = Category.create(name: '性別')
man = Category.create(name: '男性中心', ancestor_id: c4.id)
girl = Category.create(name: '女性中心', ancestor_id: c4.id)

c5 = Category.create(name: '職業')
Category.create(name: '営業', ancestor_id: c5.id)
Category.create(name: '教育', ancestor_id: c5.id)
Category.create(name: 'コンサル', ancestor_id: c5.id)
engineer = Category.create(name: 'ITエンジニア', ancestor_id: c5.id)
Category.create(name: 'クリエイティブ', ancestor_id: c5.id)

c6 = Category.create(name: 'ランダム')

CommunityCategory.create(community_id: community.id, category_id: tyugoku.id)
CommunityCategory.create(community_id: community.id, category_id: ryori.id)
CommunityCategory.create(community_id: community.id, category_id: sanju.id)
CommunityCategory.create(community_id: community.id, category_id: girl.id)

# 釣り 九州, アウトドア, 男性中心, 40大
CommunityCategory.create(community_id: fishing_community.id, category_id: kyusyu.id)
CommunityCategory.create(community_id: fishing_community.id, category_id: outdoor.id)
CommunityCategory.create(community_id: fishing_community.id, category_id: man.id)
CommunityCategory.create(community_id: fishing_community.id, category_id: yonju.id)

# 勉強会 関東, 20, エンジニア,
CommunityCategory.create(community_id: study_community.id, category_id: man.id)
CommunityCategory.create(community_id: study_community.id, category_id: engineer.id)
CommunityCategory.create(community_id: study_community.id, category_id: niju.id)
CommunityCategory.create(community_id: study_community.id, category_id: kanto.id)