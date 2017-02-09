FactoryGirl.define do
  factory :student_payment do
    value { Faker::Number.decimal(2)}
    paid { Faker::Boolean.boolean }
    date { Faker::Date.backward(345) }
    student
  end
end
