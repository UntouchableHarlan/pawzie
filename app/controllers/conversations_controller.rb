class ConversationsController < ApplicationController
  def index
  end

  private

  def conversation_params
    params.require(:conversation).permit(:sender_id, :recipient_id)
  end
end
