class RenameRakeToRankInItems < ActiveRecord::Migration
  def up
    rename_column :items, :rake, :rank
  end

  def down
    rename_column :items, :rank, :rake
  end
end
