class Institution < ApplicationRecord
  belongs_to :category
  has_many :projects
  has_many :events
  has_many :ratings

  def women_ratio
    (self.women_count.to_f / self.member_count.to_f * 100).to_i
  end
end
