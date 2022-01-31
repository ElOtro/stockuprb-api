json.data do
  json.partial! 'v1/companies/company', company: @company
  json.contacts @company.contacts do |contact|
    json.partial! "v1/contacts/contact", contact: contact
  end
end
