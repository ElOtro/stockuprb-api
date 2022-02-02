json.extract! invoice, :id, :is_active, :date, :number, :project_id, :amount, :discount, :vat, :created_at, :updated_at

json.organisation do
  if invoice.organisation
    json.id    invoice.organisation_id
    json.name  invoice.organisation_name
  else
    json.null!
  end
end

json.bank_account do
  if invoice.bank_account
    json.id    invoice.bank_account_id
    json.name  invoice.bank_account.try(:name)
  else
    json.null!
  end
end

json.company do
  if invoice.company
    json.id    invoice.company_id
    json.name  invoice.company_name
  else
    json.null!
  end
end

json.agreement do
  if invoice.agreement
    json.id    invoice.agreement_id
    json.name  invoice.agreement.try(:name)
  else
    json.null!
  end
end

json.project do
  if invoice.project
    json.id    invoice.project_id
    json.name  invoice.project.try(:name)
  else
    json.null!
  end
end

json.user do
  if invoice.user
    json.id    invoice.user_id
    json.name  invoice.user.try(:name)
  else
    json.null!
  end
end
