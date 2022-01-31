json.data do
  json.partial! 'v1/organisations/organisation', organisation: @organisation
  json.bank_account @organisation.bank_accounts do |bank_account|
    json.partial! "v1/bank_accounts/bank_account", bank_account: bank_account
  end
end
