require 'rails_helper'
describe ItemsController do
  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

    it "assigns the requested items to @items" do
      items = create_list(:item, 4)
      get :index
      expect(assigns(:items)).to match(items.sort{|a, b| b.id <=> a.id })
    end
  end
end
