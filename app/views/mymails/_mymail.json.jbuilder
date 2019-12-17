json.extract! mymail, :id, :email, :expired, :created_at, :updated_at
json.url mymail_url(mymail, format: :json)
