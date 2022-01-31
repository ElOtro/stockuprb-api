json.data @companies do |company|
  json.partial! 'v1/companies/company', company: company
end

json.meta @meta
