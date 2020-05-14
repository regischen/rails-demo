require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "Create" do
    it 'should create a user' do
      expect {
        post :create, params: {username: 'frank',
                               password: '123456',
                               password_confirmation: '123456'}
        expect(response.status).to eq 200
      }.to change { User.count }.by(+1)
    end
  end
end
