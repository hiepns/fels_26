class FollowersController < ApplicationController
  def index
    @title = "Followers"
    @user  = User.find params[:user_id]
    @users = @user.followers.paginate(page: params[:page]).per_page(10)
    render "layouts/show_follow"
  end
end
