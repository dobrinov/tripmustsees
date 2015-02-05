json.array! @locations do |location|
  json.name      location.name
  json.latitude  location.latitude
  json.longitude location.longitude
  json.url       location_slug_url(
                    country_slug: @city.country.slug,
                    city_slug: @city.slug,
                    location_slug: location.slug
                 )
end
