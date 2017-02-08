class StudentPayment < ActiveRecord::Base
  belongs_to :student

  validates :value, numericality: {greater_than: 0.0}
  validates :value, :student, :date, presence: true

end
