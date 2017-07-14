class Listing < ApplicationRecord
  belongs_to :user
  acts_as_taggable
  mount_uploaders :images, ImageUploader
  has_many :reservations


  enum verification: ["unverified", "verified"]
end
