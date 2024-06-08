require "rails_helper"

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    it "200を返す" do
      get tasks_path
      expect(response).to have_http_status 200
    end
  end

  describe "POST /tasks" do
    subject { post tasks_path, as: :turbo_stream, params: }

    context "パラメータが正常な場合" do
      let(:params) { { task: { title: "タイトル" } } }

      it "200を返す" do
        subject
        expect(response).to have_http_status 200
      end

      it "タスクが作成される" do
        expect { subject }.to change(Task, :count).by(1)
      end

      it "タスクのステータスがhave_not_done_yetとして作成される" do
        subject
        expect(Task.last.have_not_done_yet?).to be true
      end
    end

    context "パラメータが異常な場合" do
      let(:params) { { task: { title: "" } } }

      it "タスクが作成されない" do
        expect { subject }.not_to(change(Task, :count))
      end

      it "422を返す" do
        subject
        expect(response).to have_http_status 422
      end
    end
  end
end
