require "rails_helper"

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    it "200を返す" do
      get tasks_path
      expect(response).to have_http_status 200
    end
  end
end
