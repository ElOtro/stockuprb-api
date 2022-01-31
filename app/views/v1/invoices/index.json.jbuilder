json.data @invoices do |invoice|
  json.partial! 'v1/invoices/invoice', invoice: invoice
end

json.meta @meta
