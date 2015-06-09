json.array!(@products) do |product|
  json.extract! product, :id, :name, :variety, :minPrice, :medPrice, :maxPrice, :calibro, :category, :origin, :unitOfMisure, :group
  json.url product_url(product, format: :json)
end
