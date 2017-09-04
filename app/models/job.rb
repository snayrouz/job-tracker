class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sort_by_location
    locations = Job.pluck(:city).uniq

    jobs_by_city = locations.reduce({}) do |jobs, city|
      jobs[city] = Job.where(city: city)
      jobs
    end
  end

  def self.count_by_interest
    Job.order('level_of_interest desc').group(:level_of_interest).count
  end

  def self.top_companies
    Job.joins(:company).group(:name).
    order("average_level_of_interest desc").
    average(:level_of_interest).take(3)
  end

  def self.count_by_location
    Job.group(:city).order('count_city desc').count(:city)
  end

  def self.filter_by_location(location)
    Job.where(city: location)
  end

  def self.sort_by_interest
    levels = Job.pluck(:level_of_interest).uniq

    jobs_by_city = levels.reduce({}) do |jobs, level|
      jobs[level] = Job.where(level_of_interest: level)
      jobs
    end
  end

end
