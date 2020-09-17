class CommunitiesController < ApplicationController
  def new
  end

  def create
    community = Community.new(name: params[:name], url: params[:url])
    if community.save
      # category_names = params[:category].split(/\s/)
      # category_names.each do |name|
      #   category = Category.create(name: name)
      #   CommunityCategory.create(community_id: community.id, category_id: category.id)
      # end
      region = Category.find_by(name: params[:region])
      hobby = Category.find_by(name: params[:hobby])
      age = Category.find_by(name: params[:age])
      sex = Category.find_by(name: params[:sex])
      job = Category.find_by(name: params[:job])
      if region
        CommunityCategory.create(community_id: community.id, category_id: region.id)
      end
      if hobby
        CommunityCategory.create(community_id: community.id, category_id: hobby.id)
      end
      if age
        CommunityCategory.create(community_id: community.id, category_id: age.id)
      end
      if sex
        CommunityCategory.create(community_id: community.id, category_id: sex.id)
      end
      if job
        CommunityCategory.create(community_id: community.id, category_id: job.id)
      end
    else

    end
  end
end
