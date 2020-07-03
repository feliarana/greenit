# README

GreenIT workspace app.

We used webhook for the bot, which means that as soon as an update arrives, we'll deliver it to the bot for processing.
Webhook avoids our bot of havint to ask for updates frequently. Also avoids the need for some kind of polling mechainsm in the code.
Response time is also reduced and we save some CPU cyles.
Setting a webhook means Telegram a location in the form of a URL, on which our bot listens for updates.
We need to be able to connect and post updates to that URL.

Steps to get the application up and running:

* Ruby version: 2.6.6

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Sources.

https://web.archive.org/web/20150826052314/http://progrium.com/blog/2007/05/03/web-hooks-to-revolutionize-the-web/
https://es.slideshare.net/ChrisDowney8/integrating-telegram-bots-with-ruby-on-rails?from_action=save