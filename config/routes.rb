Rails.application.routes.draw do
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/courses", to: "static_pages#courses"
  get "/news", to: "static_pages#news"
  get "/news_post", to: "static_pages#news_post"
  get "/teachers", to: "static_pages#teachers" 
end
