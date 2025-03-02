class ChangeScheduledTimeToDatetime < ActiveRecord::Migration[7.1]
  def change
    change_column :deliveries, :scheduled_time, :datetime
  end
end
