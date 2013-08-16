# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

Word.delete_all

w1 = Word.create name: 'douban'
w2 = Word.create name: 'website'
w3 = Word.create name: 'food'
w4 = Word.create name: 'meat'
w5 = Word.create name: 'baidu'

WordRelation.delete_all

WordRelation.create parent_id: w2.id, child_id: w1.id
WordRelation.create parent_id: w2.id, child_id: w5.id
WordRelation.create parent_id: w3.id, child_id: w1.id
WordRelation.create parent_id: w3.id, child_id: w4.id

