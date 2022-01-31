json.data do
  json.partial! 'v1/invoices/invoice', invoice: @invoice
  json.invoice_items @invoice.invoice_items.includes(:product, :unit, :vat_rate).order(:position) do |invoice_item|
    json.partial! "v1/invoice_items/invoice_item", invoice_item: invoice_item
  end
end
