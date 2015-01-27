module SeoHelper

  def title(title = nil)
    if title.present?
      content_for :title, title
    else
      "Trip Must Sees | #{content_for(:title) || default_page_title}"
    end
  end

  def keywords(tags = nil)
    if tags.present?
      content_for(:meta_keywords, tags)
    else
      content_for?(:meta_keywords) ? [content_for(:meta_keywords), default_page_keywords].join(', ') : default_page_keywords
    end
  end

  def description(text = nil)
    if text.present?
      content_for(:meta_description, text)
    else
      content_for(:meta_description) || default_page_description
    end
  end

  def default_page_title
    'For travelers at heart'
  end

  def default_page_description
    'Trip Must Sees - Get informed about sightseeings around the world.'
  end

  def default_page_keywords
    'travel, guide, sightseeing, trip, landmark, vacation, information, location'
  end

end
