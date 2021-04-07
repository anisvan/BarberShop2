#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
	
	erb :index	
end

get '/visit' do	
	
	erb :visit
end

post '/visit' do
	@user_name=params[:username]
	@phone = params[:phone]
	@date = params[:datetime]
	@master = params[:master]
	@color =params[:color]

  c = Client.new
  c.name = @user_name
  c.phone = @phone
  c.datestamp = @date
  c.barber = @master
  c.color = @color
  c.save
	
			erb "<h1>Спасибо!</h1><h3>Уважаемый <b>#{@user_name}</b>, мы будем ждать вас <b>#{@date}</b>.<br>Ваш мастер: <b>#{@master}</b>."
	
end