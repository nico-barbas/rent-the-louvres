class ChangeDimensionsInArtworks < ActiveRecord::Migration[7.0]
  def change
    remove_column :artworks, :height
    remove_column :artworks, :width
    add_column :artworks, :dimensions, :string
  end
end
