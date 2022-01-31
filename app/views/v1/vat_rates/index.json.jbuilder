json.data @vat_rates do |vat_rate|
  json.partial! 'v1/vat_rates/vat_rate', vat_rate: vat_rate
end
