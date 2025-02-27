class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.string :pickup_address
      t.string :delivery_address
      t.decimal :weight
      t.decimal :distance
      t.date :scheduled_time
      t.decimal :cost
      t.string :driver_name

      t.timestamps
    end
  end
end
