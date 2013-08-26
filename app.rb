require 'sinatra'

class MyApp < Sinatra::Base

  enable :sessions, :protection

  configure do
    set :public_folder, Proc.new { File.join(root, "static") }
  end

  configure :development do
    enable :logging, :dump_errors, :raise_errors
  end

  get '/' do
    erb :index
  end

  error 400..510 do
    erb :error_page
  end

  get '/*' do
    status 405
  end

end
