class Schedule < ActiveRecord::Base
  searchkick text_start: [:affected_areas]

  Schedule.reindex

  scope :by_region, -> region { where(region: region)}

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Schedule.create! row.to_hash
    end
  end
end
