class CreateArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :artworks do |t|
      t.string :title
      t.float :price_per_day
      t.string :artist
      t.string :style
      t.text :description
      t.integer :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
