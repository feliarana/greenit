Telegram.bots_config = {
  default: Rails.application.credentials[:development][:telegram][:bot][:token],
  # chat: {token: CHAT_BOT_TOKEN, username: 'chatbot'},
}

Telegram.bot.get_updates
Telegram.bot == Telegram.bots[:default] # true
Telegram.bots[:default].send_message('HELLO WORLD!')
# Telegram.bot.get_meTelegram.bots[:default]].send_message('HELLO WORLD!')