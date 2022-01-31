class Company < ApplicationRecord
  include PgSearch::Model
  belongs_to :user, optional: true
  has_many :agreements, dependent: :destroy
  has_many :contacts, dependent: :destroy
  accepts_nested_attributes_for :contacts, allow_destroy: true
  validates :name, presence: true

  pg_search_scope :search, against: [:name, :full_name],
                           using: {
                             tsearch: {
                               dictionary: 'simple',
                               prefix: true
                             }
                           }
end
