require 'spec_helper'

feature 'User checks student payment details' do
  let!(:student_payment) { create :student_payment, value: 1200, paid: false, date: '2017-02-19'}

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit student_payments_path
    find(:xpath, "//a[@title='show']").click
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content "RoR Workhops » Student Payments » #{student_payment.id}"
    end
    within('.table.table-condensed') do
      expect(page).to have_content '2017-02-19'
    end
  end
end
