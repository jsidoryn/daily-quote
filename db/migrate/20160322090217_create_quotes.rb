class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :quote
      t.string :source
      t.date :published_on
      t.text :notes
      t.boolean :active

      t.timestamps null: false
    end
  end
end
