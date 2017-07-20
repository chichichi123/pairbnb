class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|

      t.string :start_date
      t.string :end_date
      t.string :listing_id
      t.string :user_id
      t.string :number_of_guest
      t.string :total_price

      t.timestamps
    end

  end
end
