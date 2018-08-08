require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    pig_latin_instance = PigLatinizer.new
    @results = pig_latin_instance.piglatinize(params[:user_phrase])

    erb :results
  end
end
