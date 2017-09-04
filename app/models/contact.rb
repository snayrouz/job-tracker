class Contact < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :company
end
