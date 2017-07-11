class Listing < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :skills, :interests
end
