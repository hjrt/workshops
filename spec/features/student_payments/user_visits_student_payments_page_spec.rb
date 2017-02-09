require 'spec_helper'

feature 'User visits student payments page'  do
  let!(:student_1) { create :student, first_name: 'Jan' }
  let!(:student_payment_1) { create :student_payment, value: 1200, paid: true, date: '2017-02-19', student: student_1}
  let!(:student_2) { create :student, first_name: 'Adam' }
  let!(:student_payment_2) { create :student_payment, value: 1600, paid: false, date: '2019-03-11', student: student_2}

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit student_payments_path
  end

  scenario 'should see student payments list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Student Payments'
    end

    expect(page).to have_content 'Jan'
    expect(page).to have_content 'Adam'
    expect(page).to have_content '2017-02-19'
    expect(page).to have_content '2019-03-11'
  end

  scenario 'only when sign in' do
    logout
    visit student_payments_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
