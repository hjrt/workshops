require 'spec_helper'

feature 'User deletes student payment' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Abacki' }
  let!(:student_payment) { create :student_payment, value: 1200, paid: false, date: '2017-02-19', student: student}

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit student_payments_path
  end

  scenario do
    find(:xpath, "//a[@title='delete']").click
    expect(page).to have_content 'Student payment has been deleted!'
    expect(page).to have_no_content 'Jan'
  end

end
