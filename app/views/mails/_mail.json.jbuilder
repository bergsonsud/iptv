json.extract! mail, :id, :email, :expired, :created_at, :updated_at
json.url mail_url(mail, format: :json)
