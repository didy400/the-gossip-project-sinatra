require 'gossip'
require 'csv'

class ApplicationController < Sinatra::Base
    

    get'/' do #make local / adresse point on index.erb
        erb :index
    end
    
    get '/gossip/new/'do
        erb :new_gossip
    end

    post '/gossip/new/' do
        Gossip.new("test", "comment").save
        redirect '/'
    end
end
