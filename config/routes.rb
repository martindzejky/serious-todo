Rails.application.routes.draw do

  root                     to: "static_pages#home"
  get "about",             to: "static_pages#about"

  devise_for :users

  get "users/:name",       to: "users#show", as: :user
  get "todo-apps/connect", to: "todo_apps#connect"
  get "todo-apps/todoist", to: "todo_apps#todoist"

  resources :tasks

end
