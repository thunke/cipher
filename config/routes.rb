Rails.application.routes.draw do
  root 'messages#show'
  get '/:id', :to => 'messages#show'

  match "/api/messages/" => "messages#show", :via => :get, :as => :get_random_message
  match "/api/messages/:id" => "messages#show", :via => :get, :as => :get_message
  match "/api/messages/:id/solution" => "messages#solution", :via => :get, :as => :get_message_solution

end
