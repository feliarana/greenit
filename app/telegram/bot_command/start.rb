module BotCommand
  class Start < Base
    def should_register?
      text =~ /\A\/pass/
    end

    def should_welcome?
      text =~ /\A\/start/
    end

    def should_start?
      should_welcome? || should_register?
    end

    def start
      return start_message if should_welcome?

      find_company_and_register if should_register?
    end

    private

    def start_message
      send_message('
Bienvenido! Soy el bot de la materia GreenIT, realizado por Joaquin Islas y Felipe Arana.
Para ingresar a los cuestionarios, ingresa la contraseña de tu compañia: /pass keydetucompañia')
      # user.reset_next_bot_command
      # user.set_next_bot_command('BotCommand::Start')
    end

    def find_company_and_register
      company_pass = message[:text].split[1]
      company = Company.find_by(key: company_pass)
      if company_pass.present? && company.present?
        register_and_send_questions(company)
      else
        invalid_key
      end
    end

    def register_and_send_questions(company)
      register_user(company)
      user.reset_next_bot_command
      user.set_next_bot_command('BotCommand::Question')
      question = BotCommand::Question.new(message, user)
      question.start
    end

    def register_user(company)
      fake_email = from[:id].to_s + '@officegreenit.com'
      @user = User.find_or_initialize_by(telegram_id: from[:id], email: fake_email, company: company) do |new_user|
        new_user.password = '123456'
      end

      @user.update_attributes!(first_name: from[:first_name], last_name: from[:last_name])
    end

    def invalid_key
      send_message('
Contraseña de compañia inválida. Ingrese nuevamente /pass keydetucompañia')
    end
  end
end
