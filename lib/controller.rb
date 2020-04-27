require 'gossip'
require 'csv'

class ApplicationController < Sinatra::Base
    

    get'/' do #make local / adresse point on index.erb
        erb :index , locals: {gossips: Gossip.all}
    end
    
    get '/gossips/:id' do
        erb :show, locals: {gossips: Gossp.find(params["id"])}
    end

    get '/gossip/new/'do
        erb :new_gossip
    end

    post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
    end
end
