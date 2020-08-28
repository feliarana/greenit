class BotMessageDispatcher
  attr_reader :message, :user

  AVAILABLE_COMMANDS = [
    BotCommand::Start,
    BotCommand::Question,
    BotCommand::Answer,
    BotCommand::Statistics
  ]

  def initialize(message)
    @message = message
  end

  def process
    bot_command = if user.present? && user.get_next_bot_command
                    find_command
                  else
                    BotCommand::Start.new(message, user)
                  end
    check_command(bot_command)
  end

  private

  def find_command
    if message[:text] =~ /\A\/cancelar/ || /\A\/preguntas/
      user.reset_next_bot_command
      user.set_next_bot_command('BotCommand::Question')
    end

    if message[:text] =~ /\A\/estadisticas/
      user.reset_next_bot_command
      user.set_next_bot_command('BotCommand::Statistics')
    end

    user.get_next_bot_command.safe_constantize.new(message, user)
  end

  def check_command(bot_command)
    if bot_command.should_start?
      bot_command.start
    else
      return undefined.unknown_public_command if user.blank?

      undefined.unknown_command
    end
  end

  def from
    message[:from]
  end

  def user
    @user ||= User.find_by(telegram_id: from[:id])
  end

  def undefined
    BotCommand::Undefined.new(message, user)
  end
end
