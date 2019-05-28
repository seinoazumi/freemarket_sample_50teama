require 'rails_helper'
describe ItemsController do
  let(:item) { create(:item) }
  let(:user) { create(:user) }

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

    # 変数の定義が変わったためコメントアウト
    # it "assigns the requested items to @items" do
    #   items = create_list(:item, 4)
    #   get :index
    #   expect(assigns(:items)).to match(items.sort{|a, b| b.id <=> a.id })
    # end
  end

  describe '#show' do
    before do
      get :show, params:{ id: item.id }
    end
    it "renders the :show template" do
      expect(response).to render_template :show
    end
    it "assigns the requested item to @item" do
      expect(assigns(:item)).to eq item
    end
    it "assigns the requested items to @items" do
      expect(assigns(:items)).to eq(Item.order(id: 'DESC').limit(4))
    end
    it "assigns the requested same_category_items to @same_category_items" do
      expect(assigns(:same_category_items)).to eq(Item.where(category_id: item.category_id).where.not(id: item.id).order(id: 'DESC').limit(6))
    end
  end

  context "as an authenticated user" do
    # 現在、destroyアクションに不具合が生じているので、その終了まで待つ
    describe 'DELETE #destroy' do
      before do
        login user
        get :show, params:{ id: item.id }
      end

      it 'deletes the item' do
        expect do
          delete :destroy, params: {id: item.id}
        end.to change(Item, :count).by(-1)
      end

      it 'redirects to root_path' do
        delete :destroy, params: {id: item.id }
        expect(response).to redirect_to root_path
      end
    end

  end
end
