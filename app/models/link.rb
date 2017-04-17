class Link < ApplicationRecord
  validates_presence_of(:url)

  scope :hottest, -> (cap = 10) { order("links.read_count DESC").limit(cap) }
end
