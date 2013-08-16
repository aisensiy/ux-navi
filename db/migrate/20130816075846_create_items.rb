class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :rake
      t.text :url
      t.text :description
      t.string :author
      t.string :type

      t.timestamps
    end
  end
end
