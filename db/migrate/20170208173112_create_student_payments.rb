class CreateStudentPayments < ActiveRecord::Migration
  def change
    create_table :student_payments do |t|
      t.decimal :value
      t.boolean :paid, default: false
      t.date :date
      t.integer :student_id
      t.timestamps null: false
    end

    add_index :student_payments, :student_id
    add_foreign_key :student_payments, :students
  end
end
