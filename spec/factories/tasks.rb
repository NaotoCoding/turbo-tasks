FactoryBot.define do
  factory :task do
    title { "title" }
    status { :have_not_done_yet }
  end
end
