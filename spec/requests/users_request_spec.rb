require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "create" do
    it 'should create a user' do
      expect {
        post :create, params: {username: 'chenyang',
                               password: '123456',
                               password_confirmation: '123456'}
        expect(response.status).to eq 200
      }.to change { User.count }.by(+1)
    end
  end

  describe 'index' do
    it 'show all users' do
      puts User.all.count
      User.create username: 'regis', password: '123', password_confirmation: "123"
      get :index
      body = JSON.parse response.body
      expect(body['resources'].length).to eq 1
    end
  end

  describe 'show' do
    it 'get a user' do
      user = User.create username: 'regis', password: '123', password_confirmation: "123"
      get :show,  params: { id: user.id}
      body = JSON.parse response.body
      expect(body['resource']['id']).to eq user.id
    end
    it 'should not get a user' do
      get :show, params: {id: 444}
      expect(response.status).to eq 404
    end
  end

  describe 'destroy' do
    it 'should delete a user' do
      user = User.create username: 'regis', password: '123', password_confirmation: "123"
      expect{
        delete :destroy, params:  {id: user.id}
        expect(response.status).to eq 200
      }.to change {User.count}.by(-1)
    end
  end
  describe 'update' do
    it 'should update a user' do
      user = User.create username: 'regis', password: '123', password_confirmation: "123"
      patch :update, params: {id: user.id, 'nickname': 'chenyang'}

      body = JSON.parse(response.body)
      expect(body['resource']['nickname']).to eq 'chenyang'
    end
  end



end
