class Lesson < ActiveRecord::Base
  belongs_to :category, :user
  has_many :lesson_words, dependent: :destroy
end
