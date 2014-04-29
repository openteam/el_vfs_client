module ElVfsClient
  Engine.routes.draw do
    get '/el_finder' => 'el_finder#show'
    get '/api/el_finder/v2' => 'el_finder#run'
    post '/api/el_finder/v2' => 'el_finder#run'
  end
end
