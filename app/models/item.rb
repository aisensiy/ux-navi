class Item < ActiveRecord::Base
  attr_accessible :author, :description, :name, :rank, :type, :url, :word_ids

  has_many :item_words
  has_many :words, :through => :item_words

  validates_presence_of :name, :url

  def save_words(words)
    words.each do |word|
      w = Word.find_or_create_by_name(word)
      ItemWord.create word: w, item: self
    end
  end
end
