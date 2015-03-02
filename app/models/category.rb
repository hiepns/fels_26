class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy
  accepts_nested_attributes_for :words, :lessons

  has_attached_file :icon,
    styles: {medium: "120x120>", thumb: "80x80>"},
    default_url: "/noavatar/:style/missing.png"
  validates_attachment :icon,
    content_type: {content_type: ["image/jpeg", "image/gif", "image/png"]}

end
