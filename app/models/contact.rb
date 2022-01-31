class Contact < ApplicationRecord
  belongs_to :company
  belongs_to :user, optional: true
  validates :name, presence: true
end
