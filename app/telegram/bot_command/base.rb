require 'telegram/bot'

module BotCommand
  class Base
    attr_reader :user, :message, :api

    def initialize(message, user = nil)
      @user = user
      @message = message
      token = Rails.application.credentials[Rails.env.to_sym][:bot_token]
      @api = ::Telegram::Bot::Api.new(token)
    end

    def should_start?
      raise NotImplementedError
    end

    def start
      raise NotImplementedError
    end

    protected

    def send_message(text, _options = {})
      @api.call('sendMessage', chat_id: telegram_id, text: text)
    end

    def send_inline_options(text, options)
      questions =
        Telegram::Bot::Types::ReplyKeyboardMarkup
        .new(keyboard: options, one_time_keyboard: true) # .new(keyboard: [%w(A B), %w(C D)], one_time_keyboard: true)
      @api.send_message(chat_id: from[:id], text: text, reply_markup: questions)
    end

    def telegram_id
      @user.present? ? @user.telegram_id : from[:id]
    end

    def text
      @message[:text]
    end

    def from
      @message[:from]
    end
  end
end
