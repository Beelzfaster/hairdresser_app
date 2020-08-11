json.extract! booking, :id, :cut, :wash, :colour, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
