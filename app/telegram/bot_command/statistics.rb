module BotCommand
  class Statistics < Base
    def should_start?
      text =~ /\A\/estadisticas/
    end

    def start
      answers = ::Answer.where(user: user)
      today_answers = answers.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
      calculator = EmissionCalculator.new

      daily_usage = calculator.calculate_emission(today_answers)
      total_usage = calculator.calculate_emission(answers)

      user.reset_next_bot_command
      user.set_next_bot_command('BotCommand::Question')

      send_message("Tu emision diaria es de #{daily_usage} KgC02eq \n" +
                   "Tu emision total registrada hasta el dia de hoy es de #{total_usage} KgC02eq \n
                   Escriba /preguntas para volver al listado de preguntas")
    end
  end
end
