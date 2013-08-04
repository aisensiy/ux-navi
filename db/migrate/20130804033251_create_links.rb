class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url, limit: 256
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
