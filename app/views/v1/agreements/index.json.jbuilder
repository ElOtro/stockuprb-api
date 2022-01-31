json.data @agreements do |agreement|
  json.partial! 'v1/agreements/agreement', agreement: agreement
end
