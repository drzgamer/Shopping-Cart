json.array!(@orders) do |order|
  json.extract! order, :id, :total, :datetime
  json.url order_url(order, format: :json)
end
