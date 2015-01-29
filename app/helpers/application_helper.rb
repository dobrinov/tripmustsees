module ApplicationHelper

  def additional_head_javascripts
    @_additional_head_javascripts || []
  end

  def additional_body_javascripts
    @_additional_body_javascripts || []
  end

  def head_javascript_includes
    additional_head_javascripts.map do |script|
      javascript_include_tag script[:src], :'data-turbolinks-track' => true
    end.join.html_safe
  end

  def body_javascript_includes
    additional_body_javascripts.map do |script|
      javascript_include_tag script[:src], :'data-turbolinks-track' => true
    end.join.html_safe
  end

  def random_landingpage_image
    [
      'landmarks/coliseum.jpg',
      'landmarks/big_ben.jpg',
      'landmarks/the_great_wall.jpg'
    ].sample
  end

end
