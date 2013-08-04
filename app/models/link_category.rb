class LinkCategory < ActiveRecord::Base
  attr_accessible :category_id, :link_id

  belongs_to :category
  belongs_to :link
end
