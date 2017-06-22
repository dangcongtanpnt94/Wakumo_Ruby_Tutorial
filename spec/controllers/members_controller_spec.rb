require "rails_helper"

RSpec.describe MembersController, type: :controller do
  # let(:member) {FactoryGirl.create(:member)}
  before :each do
    @member = FactoryGirl.create(:member, role: "Admin")
  end

  describe 'GET create' do
    it 'new member' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

 describe 'POST create' do
   it 'create user to raise standard error' do
   post :create, params: {member: {name: ''}}
   expect(response).to render_template(:new)
   end

   it 'create user to redirect to index' do
     post :create, params:
     {member: {
                  name: "dang cong tan",
                  email: "ads@asd.com",
                  dob: "1995/5/30",
                  gender: "Male",
                  role: "Admin"
              }
     }
     expect(response).to have_http_status(302)          # 302 - found / 404 - not found
   end
 end

 describe 'Get index' do
   it 'has a 200 status code - request success' do
     get :index
     expect(response.status).to eq(200)
   end
 end

 describe "Detele member" do
   context 'success' do
     it 'Delete member' do
       expect {delete :destroy, params: {id: @member}}.to change(Member, :count).by(-1)
     end
   end
 end

 describe 'Put Update' do
   it 'dont Allows an member to be updated if name is blank' do
     @attr = { name: ''}
     put :update, params: {id:@member.id, member: @attr}
     expect(response).to render_template(:edit)
   end

   it 'dont allow an member to be updated if email is blank or wrong format' do
     @attr = {email: ''}
     put :update, params: {id:@member.id, member: @attr}
     expect(response).to render_template(:edit)
   end

   it 'Allow an member to be updated' do
     @attr = {name: 'tan123', email: 'asd@asd.com'}
     put :update, params: {id:@member.id, member:@attr}
     expect(response).to redirect_to(@member)
   end
 end
end
