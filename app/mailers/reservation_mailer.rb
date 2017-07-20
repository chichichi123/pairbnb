class ReservationMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def booking_email(customer, host, reservation_id)

    @customer = customer
    @host  = 'http://localhost:3000/welcome'
    mail(to: @customer.email, subject: 'Your reservation is confirmed!')
  end
end
