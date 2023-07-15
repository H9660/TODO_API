class Subtask < ApplicationRecord
  belongs_to :task
  validates :title, presence: true, uniqueness: true
 
end
