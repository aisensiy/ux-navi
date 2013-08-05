class Link < ActiveRecord::Base
  attr_accessible :description, :title, :url, :tag_list

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :link_categories
  has_many  :categories, through: :link_categories

  def self.tagged_with(name)
    Tag.find_by_name!(name).links
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("tags.id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def category
    self.categories.first
  end
end
