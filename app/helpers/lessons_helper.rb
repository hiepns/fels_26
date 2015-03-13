module LessonsHelper
  def get_learned_word(user_id, category_id)
    learned_word = []
    old_lessons = Lesson.where({user_id: user_id, category_id: category_id})
    unless old_lessons.nil?
      old_lessons.each do |less|
        less.lesson_words.each do |lesson_word|
          learned_word << lesson_word.word_id
        end
      end
    end
    return learned_word
  end

  def get_words(learned_word, category_id)
    unless learned_word.empty?
      Word.where('category_id = ? AND id NOT IN ?', category_id,  learned_word).limit 20
    else
      Word.where(category_id: category_id).limit 20
    end
  end

  def true_answer(word)
    word.answers.find_by correct: true
  end
end
