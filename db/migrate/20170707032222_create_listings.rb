pclass CreateListings < ActiveRecord::Migration[5.0]
def change
  create_table :listings do |t|
    t.string :name
    t.string :description
    t.string :price

    t.timestamps
  end
end
end
