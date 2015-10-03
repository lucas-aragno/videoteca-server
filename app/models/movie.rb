class Movie < ActiveRecord::Base
  belongs_to :category

  validates :category, :title, :desc, :link, :image_url , presence: true
end
