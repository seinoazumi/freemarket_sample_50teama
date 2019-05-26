require 'rails_helper'

describe CardsController, type: :controller do
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  describe '#index' do
    # ログインしている場合
    context 'log in' do
      before do
        login user
        get :index, params:{user_id: user.id}
      end
      # indexが表示されるかどうか
      it "renders index" do
        expect(response).to render_template :index
      end
      # @cardがcustomerを持っているか
    end

    # ログインしていない場合
    context 'not log in' do
      before do
        get :index, params:{user_id: user.id}
      end
      # log_inにredirectされるかどうか
      it 'redirects to new_user_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#pay' do
    before do
      login user
      get :pay, params:{item_id: item.id}
    end
    it 'redirects to root_path' do
      expext(respomse).to redirect_to(root_path)
    end
  end
end
