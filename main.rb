#!/usr/bin/env ruby
require_relative 'app'
require_relative 'data'

def main
  app = App.new
  app.run
  app.save_people
  app.save_book
  app.save_rental
end
main
