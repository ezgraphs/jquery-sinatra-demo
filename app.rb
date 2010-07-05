# Sinatra version 
# http://docs.jquery.com/Tutorials:Getting_Started_with_jQuery#Rate_me:_Using_Ajax

['rubygems', 'sinatra'].each{|r|require r}

class Array
  
  def cnt
    a=0; self.each{|x|a+=1};a
  end
  
  def avg
    a=0; self.each{|x|a+=x.to_i};a.to_f/cnt.to_f
  end
  
end

configure do
  Sinatra::Application.reset!
  use Rack::Reloader
end

get '/' do
  erb :index
end

post '/process_vote' do
  
  File.open('stored_ratings.txt','a'){|f|f.puts request['rating']}
  @stored_ratings=File.open('stored_ratings.txt').readlines
  "<ratings><average>#{@stored_ratings.avg}</average><count>#{@stored_ratings.cnt}</count></ratings>"
  
end

# --------------------------------------
# R Specific Part
# --------------------------------------
get '/data' do
  File.open('stored_ratings.txt').readlines
end