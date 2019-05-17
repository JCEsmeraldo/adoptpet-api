Rails.application.routes.draw do
  resources :usuarios do
  end

  resources :pets do
  end

  match "/login" => "usuarios#login", :via => :post
  get "pets/usuarios/:id" => "pets#pets_usuario", :constraints => { :id => /\d+/ }
  get "usuarios/pedidos/:id" => "usuarios#show_pedidos", :constraints => { :id => /\d+/ }


end
