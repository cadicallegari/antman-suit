class Link < ActiveRecord::Base
  validates :url, presence: true

  validates :shorten, presence: true, uniqueness: true,
    length: { minimum: 6, maximum: 6 }
end
