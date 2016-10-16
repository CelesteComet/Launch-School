require 'sinatra'
require 'redcarpet'
require 'pry'

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

root = File.expand_path("..", __FILE__)



# Runs once for every environment (test or production)
configure do
  enable :sessions
  set :session_secret, 'super secret' 

  # Create markdown object to render markdown to HTML
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
end

helpers do 
  # Helper methods go here
end

get '/' do
  # Glob matches file names into an array
  pattern = File.join(data_path, "*")
  @filenames = Dir.glob(pattern).map do |path|
    File.basename(path)
  end
  erb :index
end

get '/:filename' do 

  file_path = root + "/data/" + params[:filename]

  file_ext = File.extname(file_path)

  if File.file?(file_path)
    case file_ext
      when ".txt"
        headers["Content-Type"] = "text/plain"
        File.read(file_path)
      when ".md"
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      
        markdown.render(File.read(file_path))
      end
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect '/'
  end
end

get '/:filename/edit' do

  file_path = root + "/data/" + params[:filename]

  @content = File.read(file_path)
  @filename = params[:filename]
  erb :edit
end

post '/:filename/edit' do

  file_path = root + "/data/" + params[:filename]

  File.open(file_path, "w") do |file|
    file.write(params[:content])
  end

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end


