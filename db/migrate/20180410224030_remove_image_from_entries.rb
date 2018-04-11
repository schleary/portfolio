class RemoveImageFromEntries < ActiveRecord::Migration[5.1]
  def change
    remove_column :entries, :image, :string
  end
end
