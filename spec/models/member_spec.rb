require 'rails_helper'

RSpec.describe Member, type: :model do
    let(:member) {FactoryGirl.create(:member)}
    # ======================== TEST db schema ============
      context "db schema" do
        it {should have_db_column(:email).of_type(:string)}
        it {should have_db_column(:name).of_type(:string)}
        it {should have_db_column(:dob).of_type(:date)}
        it {should have_db_column(:gender).of_type(:string)}
        it {should have_db_column(:role).of_type(:string)}
      end

    # ======================== TEST validation ===========
      context "validation" do
        it {should validate_presence_of(:name)}
        it {should validate_presence_of(:email)}
      end


end
