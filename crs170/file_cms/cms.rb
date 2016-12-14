require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'redcarpet'


configure do
  enable :sessions
  set :session_secret, 'mickey mouse'
end


helpers do
  def clean_filename(filename) # input e.g.: "/Users/oconnor/dropbox/coding/lsch/crs170/file_cms/data/about.txt"
  File.basename(filename) # output: "about.txt"
  end
end

root = File.expand_path('..', __FILE__) #=> "/Users/oconnor/dropbox/coding/lsch/crs170/file_cms"

get '/' do
  @files = Dir.glob(root + '/data/*')
  erb :index
end


def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end


def load_content(resource)
  content = File.read(resource)

  case File.extname(resource)
  when '.txt'
    @text = content
    headers['Content-Type'] = 'text/plain'  # sets content type in response header
  when '.md'
    @text = render_markdown(content)
  end
end


get '/:filename' do
  redirect '/' if params[:filename] =~ /favicon/

  path = root + '/data/' + params[:filename]

  unless File.file?(path)
  session[:error] = "#{params[:filename]} does not exist"
  redirect '/'
  end

  load_content(path)

  erb :document
end
