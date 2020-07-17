class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def callback
    BotMessageDispatcher.new(webhook, user).process
    render json: { status: 200 }
  end

  def webhook
    params[:message].permit!
  end

  def from
    webhook[:from]
  end

  def user
    @user ||= User.find_by(telegram_id: from[:id]) || register_user
  end

  def register_user
    @user = User.find_or_initialize_by(telegram_id: from[:id], email: 'a@a.com', company: Company.last) do |user|
      user.password = '123456'
    end

    @user.update_attributes!(first_name: from[:first_name], last_name: from[:last_name])
    @user
  end
end
