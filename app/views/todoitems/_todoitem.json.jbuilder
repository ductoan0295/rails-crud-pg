json.extract! todoitem, :id, :itemDescription, :priorityNumber, :user_id, :created_at, :updated_at
json.url todoitem_url(todoitem, format: :json)
