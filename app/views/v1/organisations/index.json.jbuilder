json.data @organisations do |organisation|
  json.partial! 'v1/organisations/organisation', organisation: organisation
end

json.meta @meta
