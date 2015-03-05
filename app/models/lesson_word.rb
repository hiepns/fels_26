class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  has_one :word
  accepts_nested_attributes_for :word
end
