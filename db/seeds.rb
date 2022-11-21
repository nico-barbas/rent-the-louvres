# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"

# la collection: donne un array avec tous les ID de leurs oeuvres
# https://collectionapi.metmuseum.org/public/collection/v1/objects
# liste des départements:
# https://collectionapi.metmuseum.org/public/collection/v1/departments

all_artworks_url = "https://collectionapi.metmuseum.org/public/collection/v1/objects?departmentIds=11|9"
artworks_serialized = URI.open(all_artworks_url).read
all_artworks = JSON.parse(artworks_serialized)
artworks_ids = all_artworks["objectIDs"].sample(100)


artworks_ids.each do |artwork_id|
  url = "https://collectionapi.metmuseum.org/public/collection/v1/objects/#{artwork_id}"
  artwork_serialized = URI.open(url).read
  artwork = JSON.parse(artwork_serialized)
  if artwork["isHighlight"] == true && artwork["primaryImage"] != "" && artwork["dimensions"] != ""
    title = artwork["title"]
    creator_name = artwork["artistDisplayName"]
    creation_date = artwork["objectDate"]
    dimensions = artwork["dimensions"]
    primary_image = artwork['primaryImage']
    type = artwork["objectName"]
    description = "this #{artwork["medium"]} from #{creator_name} was made in #{artwork["country"]}.It perfectly
    represents the #{artwork["period"]} period. It was acquired by the Metropolitan museum in #{artwork["accessionYear"]}"
    Artwork.create(title: title, creator: creator_name, description: description,
    dimensions: dimensions, creation_date: creation_date, type: type, price_per_day: rand[2000..20_000])
    Image.create(url: primary_image)
    if artwork["additionalImages"] != []
      Image.create(url: artwork['additionalImages'][0]) unless artwork['additionalImages'][0].nil?
      Image.create(url: artwork['additionalImages'][1]) unless artwork['additionalImages'][1].nil?
      Image.create(url: artwork['additionalImages'][1]) unless artwork['additionalImages'][2].nil?
      Image.create(url: artwork['additionalImages'][1]) unless artwork['additionalImages'][3].nil?
    end
  end
end

# CHANGER WIDHT AND HEIGHT TO DIMENSIONS (STRING)


# t.string "title"
# t.string "creator"
# t.text "description"
# t.float "width"
# t.float "height"
# t.date "creation_date"
# t.string "type"
# t.float "price_per_day"
