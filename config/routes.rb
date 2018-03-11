Rails.application.routes.draw do
  apipie
	root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :batches
	resources :courses
	resources :professors
  resources :prof_course_mappings
	resources :requirements
  resources :time_tables
	get '/*path' => 'home#index'
end
