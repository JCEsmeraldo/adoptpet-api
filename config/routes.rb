Rails.application.routes.draw do
  resources :usuarios do
  end

  resources :pets do
  end

  resources :pedidos do
  end

  match "/login" => "usuarios#login", :via => :post
  get "pets/usuarios/:id" => "pets#pets_usuario", :constraints => { :id => /\d+/ }
  get "pets_disponiveis/" => "pets#pets_nao_adotados"
  get "usuarios/pedidos/:id" => "usuarios#show_pedidos", :constraints => { :id => /\d+/ }
  get "usuarios/pedidos_pendentes/:id" => "usuarios#show_pedidos_pendentes", :constraints => { :id => /\d+/ }


end
