# Create SightSeeingCategories
puts "Creating SightSeeingCategories ..."
if SightSeeingCategory.any?
  puts "SightSeeingCategories already exist. Skipping..."
else
  sight_seeing_categories = %w{Museum Gallery Landmark Palace}
  sight_seeing_categories.each { |sc| SightSeeingCategory.create! }
  puts "#{sight_seeing_categories.count} SightSeeingCategories added to the database."
end