require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :user_input
    # binding.pry
  end

  post '/piglatinize' do
    pig = PigLatinizer.new
    @pl = pig.piglatinize(params[:user_phrase])
    # binding.pry
    erb :show
  end
end
