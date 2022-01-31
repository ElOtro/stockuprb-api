class InvoiceItem < ApplicationRecord
  belongs_to :invoice, inverse_of: :invoice_items, touch: true
  belongs_to :product
  belongs_to :unit
  belongs_to :vat_rate
  validates :invoice, :product, :unit, :vat_rate, presence: true

  before_save :set_vat, :set_position

  def set_vat
    self.vat = (amount * (vat_rate.rate / 100).round(2)).round(2)
  end

  def set_position
    self.position = invoice.invoice_items.size if position == 0
  end
end
