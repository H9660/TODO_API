class Task < ApplicationRecord
  has_many :subtasks
  validates :title, presence: true, uniqueness: true
  validates :completed, inclusion: { in: [true, false] }
end
