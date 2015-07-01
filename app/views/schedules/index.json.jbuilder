json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :day, :start_time, :end_time, :region, :city, :affected_areas
  json.url schedule_url(schedule, format: :json)
end
