json.extract! invoice_item, :id, :position, :description, :quantity, :price, :amount, :discount_rate,
              :discount, :vat, :created_at, :updated_at

json.product do
  if invoice_item.product
    json.id    invoice_item.product_id
    json.name  invoice_item.product.try(:name)
  else
    json.null!
  end
end

json.unit do
  if invoice_item.unit
    json.id    invoice_item.unit_id
    json.name  invoice_item.unit.try(:name)
  else
    json.null!
  end
end

json.vat_rate do
  if invoice_item.vat_rate
    json.id    invoice_item.vat_rate_id
    json.name  invoice_item.vat_rate.try(:name)
  else
    json.null!
  end
end
