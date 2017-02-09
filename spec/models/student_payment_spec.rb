require 'rails_helper'

RSpec.describe StudentPayment do
  describe 'validations' do
    it { is_expected.to validate_presence_of :value }
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :student }
  end

  describe 'database columns' do
    it { should have_db_column :value}
    it { should have_db_column :date }
    it { should have_db_column :paid }
    it { should have_db_column :student_id }
  end

  describe 'associations' do
    it { is_expected.to belong_to :student }
  end

end
