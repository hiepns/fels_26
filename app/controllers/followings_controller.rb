class FollowingsController < ApplicationController
  def index
    @title = "Followings"
    @user  = User.find params[:user_id]
    @users = @user.followings.paginate(page: params[:page]).per_page(10)
    render "layouts/show_follow"
  end
end
