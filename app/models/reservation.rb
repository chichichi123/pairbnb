class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  # calculate_price : on save

  # def total_price
  #   @reservation each do |x|
  #     y = x.end_date.to_datetime.to_i - x.start_date.to_datetime.to_i
  #     y*price
  #   end

  # def calculate_price
  #   self.reservation.end_date.to_date - @reservation.start_date.to_date ).to_i * @listing.price.to_i
  # end

end
