Rails.application.routes.draw do

    root 'pages#home' # Sets the root as the pages controller and execute the home action

    get 'about' => 'pages#about' # Go to the pages controller and execute the about action

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
