# Create LocationCategories
puts "Creating LocationCategories ..."
if LocationCategory.any?
  puts "LocationCategories already exist. Skipping..."
else
  location_categories = [
    'Museum',
    'Gallery',
    'Landmark',
    'Palace',
    'Cathedral'
  ]

  location_categories.each { |lc| LocationCategory.create!(name: lc) }
  puts "#{location_categories.count} LocationCategories added to the database."
end
