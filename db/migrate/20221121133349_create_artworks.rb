class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :creator
      t.text :description
      t.float :width
      t.float :height
      t.date :creation_date
      t.string :type
      t.float :price_per_day
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
