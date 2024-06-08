# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  status     :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Task < ApplicationRecord
  validates :title, presence: true
  validates :status, presence: true
  exnum status: { have_not_done_yet: 10, completed: 20 }

  def self.ransackable_attributes(_auth_object = nil)
    ["title"]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end
end
