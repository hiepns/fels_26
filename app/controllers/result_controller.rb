class ResultController < ApplicationController
  def index
    redirect_to categories_url unless !session[:lesson_id].nil?
    # session[:answer] = nil
    @lesson_id = session[:lesson_id]
    @lesson = Lesson.find_by(id: @lesson_id)
    @lesson_words = @lesson.lesson_words
  end

  def show
  end
end
