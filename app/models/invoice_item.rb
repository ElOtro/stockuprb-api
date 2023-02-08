class InvoiceItem < ApplicationRecord
  belongs_to :invoice, inverse_of: :invoice_items, touch: true
  belongs_to :product
  belongs_to :unit
  belongs_to :vat_rate
  validates :invoice, :product, :unit, :vat_rate, presence: true

  before_save :set_vat, :set_position

  def set_vat
    self.vat = Tax::Vat::Amount.call(amount, vat_rate.rate)
  end

  def set_position
    self.position = invoice.invoice_items.size if position == 0
  end
end
