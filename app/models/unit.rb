class Unit < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :invoice_items, dependent: :destroy
  validates :name, presence: true
  validate :check_if_products_exist, on: :destroy
  validate :check_if_invoice_items_exist, on: :destroy

  private

  def check_if_products_exist
    return true unless products.any?

    errors.add :errors, "Cant't delete, there are some references in products!"
    throw(:abort)
  end

  def check_if_invoice_items_exist
    return true unless invoice_items.any?

    errors.add :errors, "Cant't delete, there are some references in invoice items!"
    throw(:abort)
  end
end
