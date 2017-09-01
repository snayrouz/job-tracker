require 'rails_helper'

  describe Job do
    describe "validations" do
      it {is_expected.to validate_presence_of(:title)}
      it {is_expected.to validate_presence_of(:level_of_interest)}
      it {is_expected.to validate_presence_of(:city)}
      it {is_expected.to belong_to(:company)}
      it {is_expected.to belong_to(:category)}
    end

    describe "relationships" do
      it "belongs to a company" do
        job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")

        expect(job).to respond_to(:company)
      end
    end

  end
