json.extract! concert, :id, :date, :duration, :attendance, :group_id, :created_at, :updated_at
json.url concert_url(concert, format: :json)
