class AddArtworkToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :artwork, null: false, foreign_key: true
  end
end
