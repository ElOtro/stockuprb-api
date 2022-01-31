class Agreement < ApplicationRecord
  include PgSearch::Model
  belongs_to :company
  belongs_to :user, optional: true
  validates :company, :name, presence: true

  pg_search_scope :search, against: [:name],
                           using: {
                             tsearch: {
                               dictionary: 'simple',
                               prefix: true
                             }
                           }

end
