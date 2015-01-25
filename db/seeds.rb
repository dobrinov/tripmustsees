# Create LocationCategories
puts "Creating LocationCategories ..."
if LocationCategory.any?
  puts "LocationCategories already exist. Skipping..."
else
  location_categories = [
    'Bath',
    'Bridge',
    'Building',
    'Castle',
    'Chatedral',
    'Church',
    'Fountain',
    'Gallery',
    'Garden',
    'Historical Relics',
    'Monastery',
    'Monument',
    'Mosk',
    'Museum',
    'Nature Scenery',
    'Palace',
    'Park',
    'Square',
    'Stadium',
    'Statue',
    'Theme park',
    'Tower',
    'Zoo'
  ]

  location_categories.each { |lc| LocationCategory.create!(name: lc) }
  puts "#{location_categories.count} LocationCategories added to the database."
end
