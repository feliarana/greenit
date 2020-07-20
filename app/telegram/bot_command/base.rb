# require 'telegram/bot'

# module BotCommand
#   class Base
#     attr_reader :user, :message, :api

#     def initialize(user, message)
#       @user = user
#       @message = message
#       token = Rails.application.credentials[Rails.env.to_sym][:bot_token]
#       @api = ::Telegram::Bot::Api.new(token)
#     end

#     def should_start?
#       raise NotImplementedError
#     end

#     def start
#       raise NotImplementedError
#     end

#     protected

#     def send_message(text, options={})
#       @api.call('sendMessage', chat_id: @user.telegram_id, text: text)
#     end

#     def text
#       @message[:text]
#     end

#     def from
#       @message[:from]
#     end
#   end
# end