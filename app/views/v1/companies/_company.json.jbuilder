json.extract! company, :id, :logo, :name, :full_name, :company_type, :details, :created_at, :updated_at

json.user do
  if company.user
    json.id    company.user_id
    json.name  company.user.try(:name)
  else
    json.null!
  end
end
