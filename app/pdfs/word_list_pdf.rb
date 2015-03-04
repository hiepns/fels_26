class WordListPdf < Prawn::Document
  def initialize(category)
    super()
    @category = category
    @words = @category.words
    print

  end

  def print
    @words.map do |word|
      y_position = cursor - 20
      bounding_box([100, y_position], width: 100, height: 20 ) do
        font("#{Rails.root}/vendor/fonts/jp.ttf") do
          text word.word
        end
      end
      bounding_box([200, y_position], width: 100, height: 20) do
        font("#{Rails.root}/vendor/fonts/vi.ttf") do
          text word.answers.find_by(correct: true).answer
        end
      end
      move_down 40
    end
  end

end