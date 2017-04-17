class AddDefaultToLinksCount < ActiveRecord::Migration[5.0]
  def change
    change_column :links, :read_count, :integer, default: 1
  end
end
