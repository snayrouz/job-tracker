require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:title)}
    it {is_expected.to validate_uniqueness_of(:title)}
  end
end
