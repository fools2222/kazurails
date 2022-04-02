require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "Post #create" do
        context "正しい場合" do
            let(:params) do
                {user: {
                    name: "user",
                    password: "pass"
                }}
            end
        end
        it "user thinking" do
            expect(post :create, params: params).to  change(User, :count).by(1)
        end
        it "link" do
            expect(post :create,params: params).to redirect_to (root_path) 
        end 
    end
    
    
end
