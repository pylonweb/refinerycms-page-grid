Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :page_grids do
    resources :page_grids, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :page_grids, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :page_grids, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
