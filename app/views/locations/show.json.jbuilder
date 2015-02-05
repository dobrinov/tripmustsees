json.(@location, :name, :latitude, :longitude)

json.image do
  json.url image_url(@location.primary_image.file.url(:medium))
end

json.url location_slug_url(
            country_slug:  @location.country.slug,
            city_slug:     @location.city.slug,
            location_slug: @location.slug
          )
