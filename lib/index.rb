#!/usr/bin/ruby

require 'dotenv/load'
require './connection.rb'

db_name = ENV['DB_NAME']
db_user = ENV['DB_USER']

connection = Connection::DBConnection.new(db_name, db_user)

connection.add('animes', 'AngelBeats')
connection.add('animes', 'Toradora')
connection.select_all('animes')
