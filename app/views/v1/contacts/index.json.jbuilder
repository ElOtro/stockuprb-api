json.data @contacts do |contact|
  json.partial! 'v1/contacts/contact', contact: contact
end
