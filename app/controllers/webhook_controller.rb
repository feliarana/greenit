class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def callback
    BotMessageDispatcher.new(webhook).process
    render json: { status: 200 }
  end

  def webhook
    params[:message].permit!
  end
end
