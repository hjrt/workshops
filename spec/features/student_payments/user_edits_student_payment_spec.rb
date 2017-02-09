require 'spec_helper'

feature 'User edits student payment' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Abacki' }
  let!(:student_payment) { create :student_payment, value: 1200, paid: false, date: '2017-02-19', student: student}

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit student_payments_path
    find(:xpath, "//a[@title='edit']").click
  end

  scenario 'and checks breadcrumbs presence' do
    within('.breadcrumbs') do
      expect(page).to have_content "RoR Workhops » Student Payments » #{student_payment.id}"
    end
  end

  scenario 'with valid input' do
    fill_in 'Value', with: '1400'
    click_button 'Update Student payment'
    expect(page).to have_content 'Student payment has been updated!'
    expect(page).to have_content '1400'
  end

  scenario 'with invalid input' do
    fill_in 'Value', with: ''
    click_button 'Update Student payment'
    expect(page).to have_content "is not a number"
  end

end
