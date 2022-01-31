json.data @invoice_items do |invoice_item|
  json.partial! 'v1/invoice_items/invoice_item', invoice_item: invoice_item
end

json.meta @meta
