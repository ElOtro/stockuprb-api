json.extract! agreement, :id, :start_at, :end_at, :name, :created_at, :updated_at

json.company do
    if agreement.company
      json.id    agreement.company_id
      json.name  agreement.company.try(:name)
    else
      json.null!
    end
  end

json.user do
  if agreement.user
    json.id    agreement.user_id
    json.name  agreement.user.try(:name)
  else
    json.null!
  end
end
