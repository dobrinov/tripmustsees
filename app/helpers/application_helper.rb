module ApplicationHelper

  def additional_javascripts
    @_additional_javascripts || []
  end

  def additional_javascript_includes
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

end
