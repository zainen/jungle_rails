require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'new user requirements' do 

    context 'needs both password and confirm password' do

      it 'should require password entered two times' do
        @user = User.new({ name: 'jeff', email: 'asdf', password: 'asdfasdf'})
        @confirm = 'asdfasdf'
        expect(@user.password).to eql(@confirm)
      end
    end

    context 'password and name' do

      it 'should require name' do
        @user = User.new({ name: 'jeff jeff', email: 'asdf', password: 'asdfasdf' })
        expect(@user.name).to be_present
      end
      it 'should require email' do
        @user = User.new({ name: 'jeff jeff', email: 'asdf', password: 'asdfasdf' })
        expect(@user.email).to be_present
      end
      it 'should require password' do
        @user = User.new({ name: 'jeff jeff', email: 'asdf', password: 'asdfasdf' })
        expect(@user.password).to be_present
      end
      it 'should not save without password' do
        @user = User.new({ name: 'jeff jeff', email: 'asdf' })
        expect(@user).to_not be_valid
      end
      it 'should not pass with different passwords' do
        @user = User.new({ name: 'jeff jeff', email: 'asdf', password: 'asdfasdf', password_confirmation: 'asdfasd' })
        expect(@user).to_not be_valid
      end
    end

    context 'email should be unique' do

      it 'cannot make user with same email' do
        @user = User.new({ name: 'jeff', email: 'asdf', password: 'asdfasdf'})
        @user1 = User.new({ name: 'jeff', email: 'asdf', password: 'asdfasdf'})
        expect(@user1).to_not be_valid # passes because not the db that stops this from occuring but the app itself
      end
    end
  end
end
