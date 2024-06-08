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
require "rails_helper"

RSpec.describe Task, type: :model do
  it "ファクトリーデータが有効" do
    expect(build(:task)).to be_valid
  end
end
