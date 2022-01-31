# create vat_rates
def create_fake_vat_rates
  VatRate.create([{ rate: 0, name: '0%' }, { rate: 0, name: 'No VAT' }, { rate: 10, name: '10%' },
                  { rate: 20, name: '20%' }])
end

# create units
def create_fake_units
  Unit.create([{ name: 'ps.' }, { name: 'gr.' }])
end

# create bank_accounts
def create_fake_bank_accounts
  Organisation.all.each do |organisation|
    organisation.bank_accounts.create!(is_default: false, name: Faker::Bank.name, account_type: 1,
                                       details: { bik: '0445', account: Faker::Bank.account_number(digits: 13),
                                                  inn: Faker::Company.russian_tax_number,
                                                  kpp: Faker::Company.russian_tax_number,
                                                  corr_account: Faker::Bank.account_number(digits: 13) })

    organisation.bank_accounts.create!(is_default: false, name: Faker::Bank.name, account_type: 2,
                                       details: { bik: Faker::Bank.swift_bic,
                                                  account: Faker::Bank.account_number(digits: 13),
                                                  corr_account: Faker::Bank.routing_number })
  end
end

# create organisations
def create_fake_organisations
  2.times do
    name = Faker::Company.name
    full_name = "#{name} #{Faker::Company.suffix}"
    organisation = Organisation.create!(name: name, full_name: full_name, ceo: Faker::Name.name, ceo_title: 'ceo',
                                        cfo: Faker::Name.name, cfo_title: 'cfo', is_vat_payer: true)
  end
end

# create users
def create_fake_users
  admin_email = 'admin@example.com'
  manager_email = 'test@example.com'

  User.create!(is_active: true, name: Faker::Name.name, email: admin_email, password: '12345678',
               password_confirmation: '12345678', title: 'administrator',
               phone: Faker::PhoneNumber.cell_phone, role: 1)

  User.create!(is_active: true, name: Faker::Name.name, email: manager_email, password: '12345678',
               password_confirmation: '12345678', title: 'manager',
               phone: Faker::PhoneNumber.cell_phone, role: 2)
end

# create companies
def create_fake_companies
    10.times do
      name = Faker::Company.name
      full_name = "#{name} #{Faker::Company.suffix}"
      Company.create(name: name, full_name: full_name,
                     details: { inn: Faker::Company.russian_tax_number,
                                kpp: Faker::Company.russian_tax_number,
                                ogrn: '123456789', Address: Faker::Address.full_address })
    end
end

# create contacts
def create_fake_contacts
  Company.all.each do |company|
    company.contacts.create!(role: 1, title: 'ceo', name: Faker::Name.name, phone: Faker::PhoneNumber.cell_phone_with_country_code,
                             email: Faker::Internet.email, start_at: DateTime.now - 6.months)

    company.contacts.create!(role: 2, title: 'cfo', name: Faker::Name.name, phone: Faker::PhoneNumber.cell_phone_with_country_code,
                             email: Faker::Internet.email, start_at: DateTime.now - 6.months)
  end
end

# create agreements
def create_fake_agreements
  Company.all.each do |company|
    company.agreements.create!(start_at: DateTime.now - 6.months, end_at: nil,
                               name: Faker::Invoice.creditor_reference)
  end
end

# create products
def create_fake_products
    10.times do
      name = Faker::Commerce.product_name
      sku = "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 3)}"
      Product.create!(is_active: true, product_type: 1, name: name, description: "#{name} (#{Faker::Commerce.brand})",
                      sku: sku, price: Faker::Commerce.price, vat_rate_id: VatRate.pluck(:id).sample,
                      unit_id: Unit.pluck(:id).sample)
    end
end

# create invoices
def create_fake_invoices
  Company.all.each do |company|
    number = 0
    5.times do
      date2   = DateTime.new(2021, 12, 1,  0,  0,  0)
      date1   = DateTime.new(2022, 1, 27,  0,  0,  0)
      date    = Time.at((date2.to_f - date1.to_f) * rand + date1.to_f)
      number += 1
      organisation = Organisation.all.sample
      bank_account_id = organisation.bank_accounts.pluck(:id).sample
      user = User.all.sample
      invoice_items = []
      invoice = Invoice.new(is_active: true, date: date, number: number, organisation_id: organisation.id,
                            company_id: company.id, bank_account_id: bank_account_id, agreement_id: company.agreements.pluck(:id).sample,
                            user_id: user.id)
      2.times do
        product = Product.all.sample
        quantity = [1, 2, 3].sample
        invoice_items << InvoiceItem.new(position: 1, product_id: product.id, description: product.description, unit_id: product.unit_id,
                                         quantity: quantity, price: product.price, amount: quantity * product.price, vat_rate_id: product.vat_rate_id)
        invoice.invoice_items = invoice_items
        invoice.save
      end
    end
  end
end

create_fake_vat_rates
create_fake_units
create_fake_organisations
create_fake_bank_accounts
create_fake_users
create_fake_companies
create_fake_contacts
create_fake_agreements
create_fake_products
create_fake_invoices
