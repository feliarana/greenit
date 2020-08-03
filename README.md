# README

GreenIT Workspace App.

We used webhook for the bot, which means that as soon as an update arrives, we'll deliver it to the bot for processing.
Webhook avoids our bot of havint to ask for updates frequently. Also avoids the need for some kind of polling mechainsm in the code.
Response time is also reduced and we save some CPU cyles.
Setting a webhook means Telegram a location in the form of a URL, on which our bot listens for updates.
We need to be able to connect and post updates to that URL.


Requirements:

* Ruby version: 2.6.6

* Postgresql (Version > 9.0)

* Configuration


Database creation. First, you'll need to edit credentials:

1) Edit credentials from terminal:

`
rails credentials:edit --environment development
`

2)

`
development:
  bot_token: BOT_TOKEN_FROM_TELEGRAM
  database:
    host: localhost
    name: greenit_workspace
    username: your_postgres_username
    password: your_postgres_password
`

3) Run this command to execute db setup: this will create the database (if does't exits), run migrations (database tables).

- rake db:setup

Default user to enter:
user: a@a.com
password: 123456

4) Add the bot. You can search it from telegram mobile (or web) contact search like this:
![](https://drive.google.com/file/d/1ipwwoQUF0ndTRV6PcMmvzYDXgoPBK6R6/view?usp=sharing)

5) Bot commands:
/start
/pass companypass

Sources.

https://web.archive.org/web/20150826052314/http://progrium.com/blog/2007/05/03/web-hooks-to-revolutionize-the-web/

https://es.slideshare.net/ChrisDowney8/integrating-telegram-bots-with-ruby-on-rails?from_action=save
