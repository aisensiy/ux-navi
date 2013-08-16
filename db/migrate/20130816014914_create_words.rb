class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.boolean :is_show

      t.timestamps
    end
  end
end
