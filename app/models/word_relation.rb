class WordRelation < ActiveRecord::Base
  attr_accessible :child_id, :parent_id, :parent, :child

  belongs_to :parent, class_name: :Word
  belongs_to :child, class_name: :Word
end
