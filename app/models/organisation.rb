class Organisation < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :bank_accounts, dependent: :destroy
  accepts_nested_attributes_for :bank_accounts, allow_destroy: true
  validates :name, :full_name, :ceo, :cfo, presence: true
end
