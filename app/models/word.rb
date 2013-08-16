class Word < ActiveRecord::Base
  attr_accessible :is_show, :name

  has_many :parent_relations, class_name: :WordRelation, foreign_key: :child_id
  has_many :child_relations, class_name: :WordRelation, foreign_key: :parent_id

  has_many :parents, through: :parent_relations
  has_many :children, through: :child_relations

  def self.to_graph
    graph = {}
    words = Word.includes(:children)

    words.each do |word|
      graph[word.name] = [] if not graph.key?(word)
      graph[word.name] = word.children.map {|child| child.name}
    end

    graph
  end
end
