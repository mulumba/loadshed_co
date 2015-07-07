class AddRegionToSchedules < ActiveRecord::Migration
  def change
    add_reference :schedules, :region, index: true, foreign_key: true
  end
end
