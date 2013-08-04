class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :link_categories
  has_many :links, through: :link_categories
end
