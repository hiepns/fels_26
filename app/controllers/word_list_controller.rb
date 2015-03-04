class WordListController < ApplicationController
  def index
    @list_categories = Category.all.map(&:name)
    @category_selected = params[:wordlist].nil? ? Category.first.name : params[:wordlist]
    @category = Category.find_by name: @category_selected unless @category_selected.nil?

    respond_to do |format|
      format.html
      format.js
      format.json
      format.pdf do
        pdf = WordListPdf.new(@category)
        send_data pdf.render, filename: 'word_list.pdf', type: 'application/pdf'
      end

    end

  end

end
