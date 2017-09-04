class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.location_sort_hash
    group(:city).order(:city).count
  end

  def self.level_of_interest_job
    group(:level_of_interest).order(:level_of_interest).count
  end

  def self.level_of_interest_company
    top3 = group(:company_id).average(:level_of_interest).sort_by{ |k, v| v}.reverse
    top3[0..2]
  end

end
