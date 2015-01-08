class Tag < ActiveRecord::Base
  attr_accessible :name, :category_id
  has_many :taggings
  has_many :links, through: :taggings
  belongs_to :category
end
