require "rails_helper"

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    it "200を返す" do
      get tasks_path
      expect(response).to have_http_status 200
    end
  end

  describe "POST /tasks" do
    subject { post tasks_path, params: }

    context "パラメータが正常な場合" do
      let(:params) { { task: { title: "タイトル" } } }

      it "タスクが作成される" do
        expect { subject }.to change(Task, :count).by(1)
      end

      it "タスクのステータスがhave_not_done_yetとして作成される" do
        subject
        expect(Task.last.have_not_done_yet?).to be true
      end

      it "タスク一覧画面にリダイレクトする" do
        subject
        expect(response).to redirect_to tasks_path
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
