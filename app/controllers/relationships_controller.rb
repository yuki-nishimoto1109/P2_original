class RelationshipsController < ApplicationController

  def create
    follow = Relationship.new()
    follow.follower_id = current_user.id
    follow.followed_id = params[:user_id]
    follow.save
    redirect_to request.referer
  end

  def destroy
    follows = Relationship.where(follower_id: current_user.id, followed_id: params[:user_id])
    follows.each do |follow|
      follow.destroy
    end
    redirect_to request.referer
  end

  def follow
    @relationships = Relationship.where(follower_id: params[:user_id])
  end

  def followed
    @relationships = Relationship.where(followed_id: params[:user_id])
  end

end
