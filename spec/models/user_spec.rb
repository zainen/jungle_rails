require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'new user requirements' do 

    context 'needs both password and confirm password' do

      it 'should require password entered two times' do
        @user = User.new({ first_name: 'jeff', last_name: 'jeff', email: 'asdf', password: 'asdfasdf', password_confirmation: 'asdfasdf'})
        expect(@user.password).to eql(@user.password_confirmation)
      end
    end

    context 'password and name' do

      it 'should require first name' do
        @user = User.new({ first_name: 'jeff jeff', last_name: 'jeff', email: 'asdf', password: 'asdfasdf' })
        expect(@user.first_name).to be_present
      end
      it 'should require last name' do
        @user = User.new({ first_name: 'jeff jeff', last_name: 'jeff', email: 'asdf', password: 'asdfasdf' })
        expect(@user.last_name).to be_present
      end
      it 'should require email' do
        @user = User.new({ first_name: 'jeff jeff', last_name: 'jeff', email: 'asdf', password: 'asdfasdf' })
        expect(@user.email).to be_present
      end
      it 'should require password' do
        @user = User.new({ first_name: 'jeff jeff', last_name: 'jeff', email: 'asdf', password: 'asdfasdf' })
        expect(@user.password).to be_present
      end
      it 'should not save without password' do
        @user = User.new({ first_name: 'jeff jeff', last_name: 'jeff', email: 'asdf' })
        expect(@user).to_not be_valid
      end
      it 'should not pass with different passwords' do
        @user = User.new({ first_name: 'jeff jeff', last_name: 'jeff', email: 'asdf', password: 'asdfasdf', password_confirmation: 'asdfasd' })
        expect(@user).to_not be_valid
      end
    end
    
    context 'email should be unique' do
      
      it 'cannot make user with same email' do
        user = User.create({ first_name: 'jeff', last_name: 'jeff', email: '123@jeff.com', password: 'asdfasdf', password_confirmation: 'asdfasdf'})
        user1 = User.create({ first_name: 'jeff', last_name: 'jeff', email: '123@jeff.com', password: 'asdfasdf', password_confirmation: 'asdfasdf'})
        expect(user).to be_valid
        expect(user1).to_not be_valid
      end
    end
  end
end
