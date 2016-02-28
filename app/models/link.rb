SHORTCODE_REGEX = /[0-9a-zA-Z_]{6}/

class Link < ActiveRecord::Base
  before_validation :generate_shortcode

  validates :url, presence: true

  validates :shortcode, presence: true, uniqueness: true,
    length: { minimum: 6, maximum: 6 }

  validates_format_of :shortcode, with: SHORTCODE_REGEX

  def self.shortcode_regex
    SHORTCODE_REGEX
  end

  private

  def generate_shortcode
    return if self.shortcode.present?
    begin
      self.shortcode = SecureRandom.hex(6)
    end while self.class.exists?(shortcode: shortcode)
  end

end
