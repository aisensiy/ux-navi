class ItemWord < ActiveRecord::Base
  attr_accessible :item_id, :word_id, :item, :word

  belongs_to :item
  belongs_to :word
end
