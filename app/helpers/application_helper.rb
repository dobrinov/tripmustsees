module ApplicationHelper

  def header_transparent?
    @_header_transparent.present?
  end

  def additional_javascripts
    @_additional_javascripts || []
  end

  def javascript_includes
    additional_javascripts.map do |script|
      javascript_include_tag script[:src], :'data-turbolinks-track' => true
    end.join.html_safe
  end

  def random_landingpage_image
    [
      'landmarks/big_ben.jpg',
      'landmarks/coliseum.jpg',
      'landmarks/eifel_tower.jpg',
      'landmarks/jesus.jpg',
      'landmarks/pyramids.jpg',
      'landmarks/red_square.jpg',
      'landmarks/st_alexander_nevski.jpg',
      'landmarks/statue_of_liberty.jpg',
      'landmarks/stonehedge.jpg',
      'landmarks/the_great_wall.jpg'
    ].sample
  end

  def website_online_year_range
    if APP_CONFIG['founded_year'] == Time.now.year
      "#{APP_CONFIG['founded_year']}"
    else
      "#{APP_CONFIG['founded_year']} - #{Time.now.year}"
    end
  end
end
