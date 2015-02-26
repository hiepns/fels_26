class CreateLessonWords < ActiveRecord::Migration
  def change
    create_table :lesson_words do |t|
      t.integer :chosen_answer
      t.references :lesson, index: true
      t.references :word, index: true
      t.references :answer, index: true

      t.timestamps null: false
    end
    add_foreign_key :lesson_words, :lessons
    add_foreign_key :lesson_words, :words
    add_foreign_key :lesson_words, :answers
    add_index :lesson_words, [:lesson_id, :word_id,:answer_id]
  end
end
