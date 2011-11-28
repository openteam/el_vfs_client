module ElVfsClient
  Engine.routes.draw do
    match '/api/elfinder' => 'el_finder#run'
  end
end
