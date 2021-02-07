Rails.application.routes.draw do
  devise_for :users,
  controllers: {registration: 'registrations'}
root 'pages#home'

  # asオプションでルーティングに名前をつける事ができる。下記ではuse_pathが生成されているため、コントローラー、ヘルパー、ビューで使える
  get '/users/:id', to: 'users#show', as: 'user'
end
