class StudentPaymentsController < ApplicationController
  before_action :authenticate_user!

  expose(:student_payments) { StudentPayment.all }
  expose(:student_payment)

  def create
    if student_payment.save
      redirect_to student_payment_path(student_payment), notice: I18n.t('shared.created', resource: 'Student payment')
    else
      render :new
    end
  end

  def update
    if student_payment.update(student_payment_params)
      redirect_to student_payment_path(student_payment), notice: I18n.t('shared.updated', resource: 'Student payment')
    else
      render :edit
    end
  end

  def destroy
    student_payment.destroy
    redirect_to student_payments_path, notice: I18n.t('shared.deleted', resource: 'Student payment')
  end

  private

  def student_payment_params
    params.require(:student_payment).permit(:value, :paid, :date, :student_id)
  end

end
