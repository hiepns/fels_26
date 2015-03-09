class ResultController < ApplicationController
  require 'text_to_speech'
  def index
    redirect_to categories_url unless !session[:lesson_id].nil?
    @lesson_id = session[:lesson_id]
    @lesson = Lesson.find_by id: @lesson_id
    @lesson_words = @lesson.lesson_words
  end

  def show
    word = params[:word]
    speech = TextToSpeech.new("#{word}", :ja).save_to_file
    send_file(speech.path, type: 'audio/mp3', disposition: 'inline')
  end
  
end
