module ElVfsClient
  Engine.routes.draw do
    match '/api/el_finder/v2' => 'el_finder#run'
  end
end
