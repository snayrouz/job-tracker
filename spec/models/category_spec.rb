require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        category = Category.new

        expect(category).to be_invalid
      end
    end
  end

  describe 'relationships' do
    it 'has many jobs' do
      category = create(:category)

      expect(category).to respond_to(:jobs)
    end
  end
end
