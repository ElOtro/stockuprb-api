json.data do
  json.partial! 'v1/invoice_items/invoice_item', invoice_item: @invoice_item
end
