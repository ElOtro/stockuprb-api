class BankAccount < ApplicationRecord
  belongs_to :organisation
  validates :name, presence: true
end
