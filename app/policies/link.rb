module Police
  class Link

    def initialize(obj)
      @obj = obj
      @obj.valid?
    end

    def has_url?
      @obj.url.present? && !@obj.url.empty?
    end

    def is_shortcode_avaliable?
      not ::Link.exists?(shortcode: @obj.shortcode)
    end

    def is_shortcode_valid?
      (::Link.shortcode_regex =~ @obj.shortcode).present?
    end

  end
end
