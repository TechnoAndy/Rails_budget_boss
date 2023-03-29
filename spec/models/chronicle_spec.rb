require 'rails_helper'

RSpec.describe Chronicle, type: :model do
  before :each do
    @user = User.create(
      name: 'Andy',
      email: 'atdiegaardt@gmail.com',
      password: 'password'
    )

    @chronicle = Chronicle.create(
      name: 'Chronicle 1',
      amount: 100,
      author_id: @user.id
    )
  end

  describe 'chronicle#Validations' do
    it 'should be validate with valid attributes' do
      expect(@chronicle).to be_valid
    end

    it 'should have a name attribute' do
      @chronicle.name = nil
      expect(subject).not_to be_valid
    end

    it 'should have amount attribute' do
      @chronicle.amount = nil
      expect(subject).not_to be_valid
    end
  end
end
