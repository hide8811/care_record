class CareReceiversController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery prepend: true

  def new
    @care_receiver = CareReceiver.new
  end

  def create
    @care_receiver = CareReceiver.new(care_receiver_params)

    if @care_receiver.save
      redirect_to root_path, flash: { success: '登録しました' }
    else
      render :new
    end
  end

  def show
    @care_receiver = CareReceiver.find(params[:id])
    @care_receiver_age = (Date.today.strftime('%Y%m%d').to_i - @care_receiver.birthday.strftime('%Y%m%d').to_i) / 10_000
  end

  private

  def care_receiver_params
    params.require(:care_receiver).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, enroll: true)
  end
end
