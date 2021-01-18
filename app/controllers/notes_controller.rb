class NotesController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery prepend: true

  def index
    @care_receiver = CareReceiver.all
  end
end
