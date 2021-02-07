Rails.application.routes.draw do
  devise_for :users,
             controllers: { registration: 'registrations' }

  root 'posts#index'

  # asオプションでルーティングに名前をつける事ができる。下記ではuse_pathが生成されているため、コントローラー、ヘルパー、ビューで使える
  get '/users/:id', to: 'users#show', as: 'user'

  resources :posts, only: %i(new create index show destroy) do
    resources :photos, only: %i(create)

    resources :likes, only: %i(create destroy)
  end
end
