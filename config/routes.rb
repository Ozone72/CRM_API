require 'api_subdomain'
Rails.application.routes.draw do

  resources :leads
    namespace :v1 do
        post '/new_user' => 'users#create'
        post '/user_login' => 'auths#create'
        delete '/user_logout' => 'auths#destroy'
        # routes under the v1/auths namespace run header authentication protocols
        namespace :auths, path: '' do
            resources :users
            resources :companies do
                namespace :companies, path: '' do
                    resources :users

                    resources :forms do
                        namespace :forms, path: '' do
                            resources :contact_forms
                            resources :address_forms
                            resources :transaction_forms
                        end
                    end
                    resources :groups do
                        namespace :groups, path: '' do
                            resources :group_users
                        end
                    end
                end
            end
        end
    end
end
