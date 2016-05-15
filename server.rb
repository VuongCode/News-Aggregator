require 'sinatra'
require 'csv'

get "/" do
  "<h1>Welcome to the place where articles are made<h1>"
end

get "/articles" do
  @articles = CSV.read('articles.csv')
  erb :index
end

get '/articles/new' do
  erb :new
end

post '/articles/new' do

  @article_title = params['article_title']
  @article_url = params['article_url']
  @article_description = params['article_description']

  CSV.open('articles.csv', 'a') do |csv|
    csv << [@article_title, @article_url, @article_description]
  end

  redirect '/articles'
end
