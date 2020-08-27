class BotMessageDispatcher
  attr_reader :message, :user
  AVAILABLE_COMMANDS = [
    BotCommand::Start
  ]

  def initialize(message)
    @message = message
  end

  def process

    return unregistered_user if user.blank?

    start_command = BotCommand::Start.new(user, message)

    if user.get_next_bot_command
      bot_command = user.get_next_bot_command.safe_constantize.new(user, message)

      if bot_command.should_start?
        bot_command.start
      else
        unknown_command
      end
    else
      if start_command.should_start?
        start_command.daily_questions(user)
      else
        unknown_command
      end
    end
  end

  private

  def from
    message[:from]
  end

  def user
    @user ||= User.find_by(telegram_id: from[:id])
  end

  def unregistered_user
    temp_user = User.new(telegram_id: message[:from][:id])
    start_command = BotCommand::Start.new(temp_user, message)
    return start_command.start if start_command.should_start?

    company_pass = message[:text].split[1]
    company = Company.find_by(key: company_pass)
    if company_pass.present? && company.present?
      register_user(company)
    else
      start_command.send_question
    end
  end

  def unknown_command
    BotCommand::Undefined.new(user, message).start
  end

  def isEmail(str)
    return str.match(/[a-zA-Z0-9._%]@(?:[a-zA-Z0-9]\.)[a-zA-Z]{2,4}/)
  end

  def register_user(company)
    fake_email = message[:from][:id].to_s + '@officegreenit.com'
    @user = User.find_or_initialize_by(telegram_id: from[:id], email: fake_email, company: company) do |user|
      user.password = '123456'
    end

    @user.update_attributes!(first_name: from[:first_name], last_name: from[:last_name])
    @user
  end
end
