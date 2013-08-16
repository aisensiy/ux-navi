class CreateItemWords < ActiveRecord::Migration
  def change
    create_table :item_words do |t|
      t.integer :item_id
      t.integer :word_id

      t.timestamps
    end
  end
end
