# Chat Time!

Chat time is a small experimental app built in Ruby on Rails with a PostgreSQL database that allows two users to chat with each other. 
![Chat Time!](images/chat_time.png)

## Features
Chat time allows a user to indicate who they are, and with whom they would like to chat. 
![Chat Time Start Screen](images/chat_start.png)

It then displays the chat history between the two users, allows the user to enter a new message, and saves that to the chat history between the two users. It also provides a "Get New Messages" link that will refresh the page and allow the user to see any new messages that may have come in. 
![Send New Chat](images/chat_two.png)

### Schema Design
Chat Time has a very straight-forward schema. Messages have a `content` string along with a `sender` and a `receiver`, both of which are foreign keys to the `users` table. 

![Schema](images/schema.png)

### Future Iterations
The goal behind this app was to get a small app working quickly. With more time, here are some of the things I would like to implement!
* Some form of auto-reloading or auto-fetching of new messages, so that users would not have to use the "Get New Messages" link. 
  * One way to do this would be to fetch the messages on the chat page using a jQuery function instead of the `@messages` instance variable in the ChatController. This could then be set to reload every few seconds.
  * Ideally I would use [ActionCable](https://guides.rubyonrails.org/action_cable_overview.html), the Rails implementation of WebSockets, to provide real-time updates as new messages are created. 
* Authentication and authorization.
  * Currently users are created as needed, with the name functioning as a unique validator. 
  * Moving to a model where a user is logged in would simplify some of the existing logic where users need to be passed around using hidden fields and the like. 
* Styling!
  * As minimalist chic as default browser styling is, Chat Time could probably use a little bit of styling help.


## Installing Locally
To run Chat Time on your local machine, navigate to the directory in which you would like to install it, and run the following commands to clone the repository and set up the database.
```
git clone git@github.com ...XXXXXX ADD HERE
cd chat_time
bundle install
bundle exec rake db:{create,migrate,seed}
```
You can then run the app using
```
bundle exec rails s
```
and access the app by pointing your browser to `http://localhost:3000`

### Testing
Chat time is tested using RSpec with Capybara. To run the test suite:
```
bundle exec rspec
```
Green means passing tests, red means failing.

## Built With
* [Ruby 2.4.5](https://ruby-doc.org/core-2.4.5/)
* [Rails 5.2.3](https://guides.rubyonrails.org/)
* [RSpec](http://rspec.info/)
* [Capybara](https://github.com/teamcapybara/capybara/blob/3.12_stable/README.md)
* [PostgreSQL](https://www.postgresql.org/)


