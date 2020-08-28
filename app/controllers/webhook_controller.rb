class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def callback
    return if webhook.blank?

    BotMessageDispatcher.new(webhook).process
    render json: { status: 200 }
  end

  def webhook
    params[:message].permit! if params[:message].present?
  end
end
