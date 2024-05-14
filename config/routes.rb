Rails.application.routes.draw do
  # get("/", { :controller => "articles", :action => "index" })
  root :to => "places#index"
  resources "places"
  resources "entries"
end
