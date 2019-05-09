Rails.application.routes.draw do
  resources :usuarios do
  end

  resources :pets do
  end

  get "pets/usuarios/:id" => "pets#pets_usuario", :constraints => { :id => /\d+/ }
end
