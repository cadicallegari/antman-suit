module ::Parser
  class Link

    def self.parse(values)
      obj = ::Link.new
      obj.url       = values[:url]       rescue nil
      obj.shortcode = values[:shortcode] rescue nil
      obj
    end

  end
end
