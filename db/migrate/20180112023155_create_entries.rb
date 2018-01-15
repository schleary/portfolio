class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.datetime :date
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end
