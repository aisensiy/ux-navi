class AddRankToWords < ActiveRecord::Migration
  def change
    add_column :words, :rank, :integer
  end
end
