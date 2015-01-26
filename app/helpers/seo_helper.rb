module SeoHelper

  def page_title
    @_page_title || default_page_title
  end

  def set_page_title(title)
    @_page_title = title
  end

  def default_page_title
    'For travelers at heart'
  end

end
