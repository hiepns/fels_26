class Category < ActiveRecord::Base
  has_many :words, :lessons, dependent: :destroy
end
