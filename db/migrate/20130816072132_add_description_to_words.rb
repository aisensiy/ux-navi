class AddDescriptionToWords < ActiveRecord::Migration
  def change
    add_column :words, :description, :text
  end
end
