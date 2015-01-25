xml.instruct!
xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
  @static_paths.each do |path|
    xml.url do
      xml.loc "#{request.protocol}#{request.host_with_port}#{path}"
      xml.changefreq("weekly")
    end
  end

  @countries.each do |country|
    xml.url do
      xml.loc "#{request.protocol}#{request.host_with_port}#{country_slug_path(
                                                            country_slug: country.slug
                                                          )}"
      xml.changefreq("monthly")
    end
  end

  @cities.each do |city|
    xml.url do
      xml.loc "#{request.protocol}#{request.host_with_port}#{city_slug_path(
                                    country_slug: city.country.slug,
                                    city_slug:    city.slug
                                  )}"
      xml.changefreq("monthly")
    end
  end

  @locations.each do |location|
    xml.url do
      xml.loc "#{request.protocol}#{request.host_with_port}#{location_slug_path(
                                    country_slug:  location.country.slug,
                                    city_slug:     location.city.slug,
                                    location_slug: location.slug
                                  )}"
      xml.changefreq("monthly")
    end
  end

end
