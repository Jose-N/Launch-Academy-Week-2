require 'csv'
require 'sinatra'
require 'pry'

set :bind, '0.0.0.0' 

get '/' do
  erb :index
end

get '/articles/new' do
  erb :articles_new
end

post '/articles/new' do
  @name = params[:article_name]
  @url = params[:article_url]
  @description = params[:article_description]
  @error_name = ''
  @error_url = ''
  @error_desc = ''

  if !@name.empty? && !@url.empty? && !@description.empty?
    CSV.foreach("../list_of_articles.csv", 'r') do |row|
      if row[1] == @url
        @error_url = 'This article already exist please try another one'
      elsif !row[1].include? "http"
        @error_url = 'This is not a valid url please try again'
      end
      erb :articles_new, :locals => {:error_url => @error_url}
    end
    if @description.length < 20
      @error_desc = 'Description needs to be more than 20 characters long'
    else
     CSV.open("../list_of_articles.csv", "ab") do |csv|
      csv << [@name, @url, @description]
     end

     redirect '/articles'
    end
  else
    if @name.empty?
      @error_name = 'Error you need to submit a title'
    end
    if @url.empty?
      @error_url = 'Error you need to submit a URL'
    end
    if @description.empty?
      @error_desc = 'Error you need to submit a description'
    end
  end

  erb :articles_new, :locals => {:error_name => @error_name, :error_url => @error_url, :error_desc => @error_desc}
end

get '/articles' do
  @array_of_articles = CSV.read('../list_of_articles.csv', 'r')

  erb :articles
end
