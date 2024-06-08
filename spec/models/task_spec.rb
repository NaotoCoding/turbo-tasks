require "rails_helper"

RSpec.describe Task, type: :model do
  it "ファクトリーデータが有効" do
    expect(build(:task)).to be_valid
  end
end
