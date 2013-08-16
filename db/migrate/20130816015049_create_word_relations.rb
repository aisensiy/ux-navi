class CreateWordRelations < ActiveRecord::Migration
  def change
    create_table :word_relations do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end
end
