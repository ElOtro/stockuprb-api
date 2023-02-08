class Invoice < ApplicationRecord
  belongs_to :organisation
  belongs_to :bank_account
  belongs_to :company
  belongs_to :agreement
  belongs_to :project, optional: true
  belongs_to :user, optional: true
  has_many :invoice_items, dependent: :destroy
  accepts_nested_attributes_for :invoice_items, allow_destroy: true
  validates :organisation, :bank_account, :company, :agreement, presence: true

  before_save :set_total

  delegate :name, to: :organisation, allow_nil: true, prefix: true
  delegate :name, to: :company, allow_nil: true, prefix: true

  def total_vat
    invoice_items.sum(&:vat)
  end

  def total_amount
    invoice_items.sum(&:amount)
  end

  def set_total
    self.amount = total_amount
    self.vat = total_vat
  end
end
