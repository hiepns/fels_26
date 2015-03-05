class LessonsController < ApplicationController
  before_action :logged_in_user
  include LessonsHelper
  def index
    @user_id = params[:user_id]
    @category_id = params[:category_id]

    @clicked = params[:id].nil? ? -1 : params[:id].to_i
    @current = params[:current].nil? ? 1 : params[:current].to_i
    @category = Category.find_by id: @category_id
    
    @lesson = Lesson.new
    @lesson.user_id = @user_id
    @lesson.category_id = @category_id
    @learned_word = get_learned_word @user_id, @category_id
    @random_word = get_random_word @learned_word
    if @random_word.size < 1
      flash[:danger] = 'Not enough 20 words to start new lesson!'
      redirect_to categories_path
      return
    end
    @word = @random_word[@current - 1]
    respond_to do |format|
      format.html
      format.js
      format.json
    end

  end

  def new
  end

  def create
  end

  def show
  end

end
