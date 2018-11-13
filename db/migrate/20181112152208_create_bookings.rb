class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :desk, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at
      t.string :review
      t.integer :rating

      t.timestamps
    end
  end
end
