json.extract! product, :id, :is_active, :product_type, :name, :description, :sku, :price, :created_at, :updated_at

json.vat_rate do
  if product.vat_rate
    json.id    product.vat_rate_id
    json.name  product.vat_rate.try(:name)
  else
    json.null!
  end
end

json.unit do
  if product.unit
    json.id    product.unit_id
    json.name  product.unit.try(:name)
  else
    json.null!
  end
end

json.user do
  if product.user
    json.id    product.user_id
    json.name  product.user.try(:name)
  else
    json.null!
  end
end
