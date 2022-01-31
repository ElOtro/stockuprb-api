json.data @bank_accounts do |bank_account|
  json.partial! 'v1/bank_accounts/bank_account', bank_account: bank_account
end
