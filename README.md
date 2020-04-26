# Live Chat App

> Simple live chat web application written in Ruby on Rails using Action Cable.

## Installation

Download the source code and run those commands in the main project folder.
```ruby
bundle install
rails server
```

and go to 
`localhost:3000` in your browser.

## Features

Live Chat App is a simple web application which allows real-time messages 
sending. It uses Action Cable Rails library to easily make use of Websockets
in order to provide client-client communication. 

#####Provided features

 - user sign up and logging
 - chatroom CRUD
 - creating messages in chosen chatroom
 - displaying new messages in real-time
 - preserving user session
