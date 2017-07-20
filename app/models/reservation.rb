class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  validate :check_overlapping_dates

  def check_overlapping_dates
    listing.reservations.each do |old_booking|
      if overlap?(self, old_booking)
        return errors.add(:overlapping_dates, "The dates conflict with another booking")
      end
    end
  end

  def overlap?(x,y)
    (x.start_date.to_date - y.end_date.to_date) * (y.start_date.to_date-x.end_date.to_date) > 0
  end
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
