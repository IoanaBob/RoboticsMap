class Institution < ApplicationRecord
  belongs_to :category
  has_many :projects
  has_many :events
  has_many :ratings
end
