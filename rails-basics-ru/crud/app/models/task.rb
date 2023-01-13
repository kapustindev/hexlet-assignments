class Task < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true
  validates :creator, presence: true
  validates :completed, presence: true

  attribute :status, default: -> { 'New' }
  attribute :completed, default: -> { false }
end
