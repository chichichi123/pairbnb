class BraintreeController < ApplicationController

  def new
    @client_token = Braintree::ClientToken.generate
  end

  def checkout
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    result = Braintree::Transaction.sale(
      :amount => "10.00", #this is currently hardcoded
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
    )

    @reservation = Reservation.find(params[:id])

    if result.success?
      redirect_to welcome_path, :flash => { :success => "Transaction successful!" }
      ReservationMailer.booking_email(@reservation.user, @reservation.listing.user, @reservation.id).deliver_later

    else
      redirect_to welcome_path, :flash => { :error => "Transaction failed. Please try again." }
    end


  end
end
