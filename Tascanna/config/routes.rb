Rails.application.routes.draw do

    devise_for :users

    resources :tasks do
        member do
            put :change
        end
    end

    root 'pages#home' # Sets the root as the pages controller and execute the home action

    get 'about' => 'pages#about' # Go to the pages controller and execute the about action

    get 'test' => 'pages#test' # Go to the pages controller and execute the test action

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
