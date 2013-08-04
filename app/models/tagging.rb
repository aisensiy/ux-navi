class Tagging < ActiveRecord::Base
  attr_accessible :tag_id, :link_id
  belongs_to :tag
  belongs_to :link
end
