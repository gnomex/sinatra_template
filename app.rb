require 'sinatra'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions, :protection
end

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  error 400..510 do
    'Booooooooooooooom'
  end

  get '/*' do
    status 405
  end

end
