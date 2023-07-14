class Task < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :completed, inclusion: { in: [true, false] }
end
