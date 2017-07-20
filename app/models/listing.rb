class Listing < ApplicationRecord
  belongs_to :user
  acts_as_taggable
  mount_uploaders :images, ImageUploader
  has_many :reservations


  enum verification: ["unverified", "verified"]

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
