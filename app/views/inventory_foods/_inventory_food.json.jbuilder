json.extract! inventory_food, :id, :quantity, :inventories_id, :foods_id, :created_at, :updated_at
json.url inventory_food_url(inventory_food, format: :json)
