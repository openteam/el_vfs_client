module ElVfsClient
  Engine.routes.draw do
    match '/el_finder' => 'el_finder#show', :via => :get
    match '/api/el_finder/v2' => 'el_finder#run'
  end
end
