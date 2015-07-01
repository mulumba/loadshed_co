class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :day
      t.datetime :start_time
      t.datetime :end_time
      t.string :region
      t.string :city
      t.text :affected_areas

      t.timestamps null: false
    end
  end
end
