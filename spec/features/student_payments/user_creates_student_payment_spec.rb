require 'spec_helper'

feature 'User creates student payment' do
  let!(:student) { create :student }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit student_payments_path
    click_on 'Add new one'
  end

  scenario 'with valid input' do
    select student.decorate.full_name, from: 'Student'
    fill_in 'Value', with: '1234'
    select "2018", from: "student_payment[date(1i)]"
    select "April", from: "student_payment[date(2i)]"
    select "13", from: "student_payment[date(3i)]"
    find("input[type='checkbox']").set(true)
    click_button 'Create Student payment'
    expect(page).to have_content 'Student payment has been created!'
  end

  scenario 'with not selected student' do
    fill_in 'Value', with: '1234'
    select "2018", from: "student_payment[date(1i)]"
    select "April", from: "student_payment[date(2i)]"
    select "13", from: "student_payment[date(3i)]"
    find("input[type='checkbox']").set(true)
    click_button 'Create Student payment'
    expect(page).to have_content "can't be blank"
  end

  scenario 'with missing value' do
    select student.decorate.full_name, from: 'Student'
    select "2018", from: "student_payment[date(1i)]"
    select "April", from: "student_payment[date(2i)]"
    select "13", from: "student_payment[date(3i)]"
    find("input[type='checkbox']").set(true)
    click_button 'Create Student payment'
    expect(page).to have_content "is not a number"
  end

  scenario 'with not checked paid' do
    select student.decorate.full_name, from: 'Student'
    fill_in 'Value', with: '1234'
    select "2018", from: "student_payment[date(1i)]"
    select "April", from: "student_payment[date(2i)]"
    select "13", from: "student_payment[date(3i)]"
    click_button 'Create Student payment'
    expect(page).to have_content 'Student payment has been created!'
  end
end
