class Product < ApplicationRecord
  include PgSearch::Model
  belongs_to :vat_rate
  belongs_to :unit
  belongs_to :user, optional: true
  has_many :invoice_items, dependent: :destroy
  validates :name, presence: true
  validate :check_if_invoice_items_exist, on: :destroy

  pg_search_scope :search, against: [:search_vector],
                           using: {
                             tsearch: {
                               dictionary: 'simple',
                               tsvector_column: 'search_vector',
                               prefix: true
                             }
                           }

  private

  def check_if_invoice_items_exist
    return true unless invoice_items.any?

    errors.add :errors, "Cant't delete, this product has been used in some invoice items!"
    throw(:abort)
  end
end
