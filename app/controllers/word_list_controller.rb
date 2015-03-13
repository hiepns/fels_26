class WordListController < ApplicationController
  before_action :logged_in_user
  include LessonsHelper
  def index
    @list_categories = Category.all.map(&:name)
    @category_selected = params[:wordlist].nil? ? Category.first.name : params[:wordlist]
    @category = Category.find_by name: @category_selected unless @category_selected.nil?
    @learned_word = get_learned_word @current_user.id, @category.id
    session[:choose] = params[:choose].nil? ? session[:choose] : params[:choose]
    case session[:choose]
    when 'not learned'
      @wordlist = @category.words.where.not(id: @learned_word)
    when 'learned'
      @wordlist = @category.words.where(id: @learned_word)
    when 'all'
      @wordlist = @category.words
    else
    @wordlist = @category.words
    end
    respond_to do |format|
      format.html
      format.js
      format.json
      format.pdf do
        pdf = WordListPdf.new(@wordlist)
        send_data pdf.render, filename: 'word_list.pdf', type: 'application/pdf'
      end
    end
  end
end