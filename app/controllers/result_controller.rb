class ResultController < ApplicationController
  require 'text_to_speech'

  def index
    redirect_to categories_url unless !session[:lesson_id].nil?
    @lesson_id = session[:lesson_id]
    @lesson = Lesson.find_by id: @lesson_id
    @lesson_words = @lesson.lesson_words
    @results = []
    @score = 0
    @lesson_words.each_with_index do |lesson_word, i|
      @results[i] = []
      true_answer = Answer.find_by(word_id: lesson_word.word_id, correct: true)
      @results[i][0] = Word.find_by(id: lesson_word.word_id).word
      @results[i][1] = true_answer.answer
      if true_answer.id == lesson_word.answer_id
        @score += 1
        @results[i][3] = true
      else
        @results[i][3] = false
      end
    end
  end

  def show
    word = params[:word]
    speech = TextToSpeech.new("#{word}", :ja).save_to_file
    send_file(speech.path, type: 'audio/mp3', disposition: 'inline')
  end

end
