community = Community.create(name: '主婦コミュニティ', url: 'https://discord.gg/uYebc84')
categories = ['ガーデニング', '料理', '家族', '子育て']
categories.each do |category|
  Category.create(name: category)
end

# Category.create(id: #id, name: #名前, ancestor_id: #親id)