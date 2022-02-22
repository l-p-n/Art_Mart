class AddPhotoToArtworks < ActiveRecord::Migration[6.1]
  def change
    add_column :artworks, :photo, :string
  end
end
