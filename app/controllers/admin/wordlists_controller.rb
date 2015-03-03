class Admin::WordlistsController < Admin::AdminsController
  def index
    @categories = ['All'] + Category.all.map(&:name)
    @selected_category = params[:category].nil? ? 'All' : params[:category]
    @wordlist = @selected_category == 'All' ? Word.all : Category.find_by(name: @selected_category).words

    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  def new
    @word = Word.new
    @categories = Category.all.map{|c| [c.name, c.id]}
    4.times do 
      @word.answers.build
    end
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = "Created success"
      redirect_to admin_wordlists_url
    else
      render "new"
    end
  end

  def show
  end

  def edit
    @word = Word.find params[:id]
    @categories = Category.all.map{|c| [c.name, c.id]}
  end

  def update
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      flash[:success] = "Word updated"
      redirect_to admin_wordlists_url
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def word_params
    params.require(:word).permit :word, :category_id, answers_attributes: [:correct, :answer, :id]
  end
end
