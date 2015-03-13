Rails.application.routes.draw do
  root 'messages#show'
  get '/:id', :to => 'messages#show'

end
