# encoding: utf-8
require 'csv'

Link.delete_all
links = JSON.parse File.read('db/seeds/links.json')
links.each { |link| Link.create! link }

Tag.delete_all
tags = JSON.parse File.read('db/seeds/tags.json')
tags.each { |tag| Tag.create! tag }

Tagging.delete_all
taggings = JSON.parse File.read('db/seeds/taggings.json')
taggings.each { |tagging| Tagging.create! tagging }

Category.delete_all
categories = JSON.parse File.read('db/seeds/category.json')
categories.each { |cate| Category.create! cate }

LinkCategory.delete_all
cate_links = JSON.parse File.read('db/seeds/link_category.json')
cate_links.each { |cl| LinkCategory.create! cl }

def import_words_from_csv(filename)
  CSV.foreach(filename) do |row|
    name = row[0]
    parents = row[1]
    description = row[2]
    rank = row[3]

    word = Word.find_or_initialize_by_name(name: name)
    if description
      word.description = description
    end
    word.rank = rank
    word.save

    if parents
      parents.split('、').each do |parent|
        parent_word = Word.find_or_create_by_name(name: parent)
        WordRelation.create parent: parent_word, child: word
      end
    end
  end
end

Word.delete_all
WordRelation.delete_all
import_words_from_csv('db/seeds/words.csv')

def import_items_from_csv(filename)
  CSV.foreach(filename) do |row|
    item = Item.new

    item.name = row[0]
    item.rank = row[1]
    item.url = row[2]
    item.description = row[3]
    item.item_type = row[5]

    item.save

    if row[6]
      words = row[6].split('、')
      item.save_words(words)
    end
  end
end

Item.delete_all
ItemWord.delete_all
import_items_from_csv('db/seeds/items.csv')
