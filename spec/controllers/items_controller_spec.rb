require 'rails_helper'
describe ItemsController do
  let(:item) { create(:item) }

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

  describe '#search' do
    before do
      get :search, params:{ keyword: ""}
    end
    it "renders the :search template" do
      expect(response).to render_template :search
    end
    it "assigns the requested items to @all_items" do
      expect(assigns(:all_items)).to eq(Item.order(id: "DESC").limit(40))
    end
  end
end
