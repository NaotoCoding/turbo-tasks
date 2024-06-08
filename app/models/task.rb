class Task < ApplicationRecord
  validates :title, presence: true
  validates :status, presence: true
  enum :status, { have_not_done_yet: 10, completed: 20 }
end
