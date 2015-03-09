class LessonsController < ApplicationController
  MAX_WORD = 4
  before_action :logged_in_user
  include LessonsHelper
  def index
    session[:answer] = nil
    session[:current] = nil
    @user_id = params[:user_id]
    @category_id = params[:category_id]

    session[:answer] ||= [] unless !session[:answer].nil?
    @clicked = params[:id].nil? ? -1 : params[:id].to_i
    @current = params[:current].nil? ? 1 : params[:current].to_i
    @current = !session[:current].nil? && @current < session[:current] ? session[:current] : @current
    @category = Category.find_by id: @category_id
    # session[:answer] = nil
    # session[:current] = nil
    @learned_word = get_learned_word @user_id, @category_id
    @wordlist = get_words @learned_word
    # byebug
    if @wordlist.size < MAX_WORD
      flash[:danger] = 'Not enough 20 words to start new lesson!'
      redirect_to categories_url
    return
    end
    @word = @wordlist[@current - 1]
    session[:current] = @current
    session[:answer][@wordlist[@current-2].id] = @clicked
    if @current > MAX_WORD
      @lesson = Lesson.new
      @lesson.user_id = @user_id
      @lesson.category_id = @category_id
      @lesson.save

      @wordlist.each do |word|
        @lesson_word = LessonWord.new
        @lesson_word.word_id = word.id
        @lesson_word.lesson_id = @lesson.id
        @lesson_word.answer_id = session[:answer][word.id]
        @lesson_word.save
      end
      session[:lesson_id] = @lesson.id
      session[:current] = nil
      session[:answer] = nil
      render js: "window.location.pathname='#{result_path}'"
    else
      respond_to do |format|
        format.html
        format.js
        format.json
      end
    end

  end
  
end
