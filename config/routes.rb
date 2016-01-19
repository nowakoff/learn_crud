Rails.application.routes.draw do
  get '/articles' => 'articles#index', as: 'articles'
  get '/articles/new' => 'articles#new', as: 'new_article'
  get '/articles/:id' => 'articles#show', as: 'article'
  get '/articles/:id/edit' => 'articles#edit', as: 'edit_article'
  post '/articles' => 'articles#create'
  patch '/articles/:id' => 'articles#update'
  delete '/articles/:id' => 'articles#destroy'
  post '/articles/:article_id/comments' => 'comments#create', as: 'article_comments'

end
