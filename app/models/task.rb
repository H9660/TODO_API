class Task < ApplicationRecord
  has_many :subtasks , dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :completed, inclusion: { in: [true, false] }
end
