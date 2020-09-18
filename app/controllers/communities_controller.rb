class CommunitiesController < ApplicationController
  def new
  end

  def create
    unless params[:name] && params[:url] && params[:picture]
      flash.now[:danger] = "登録に失敗しました。name, url, pictureを入力してください"
      render :new
    else
      community = Community.new(name: params[:name], url: params[:url], picture: params[:picture])
      if community.save
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
        flash.now[:danger] = "登録に失敗しました。name, url, pictureを入力してください"
        render :new
      end
    end
  end
end
