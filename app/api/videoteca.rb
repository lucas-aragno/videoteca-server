module Videoteca
  class API < Grape::API
    version 'v1', using: :header, vendor: 'videoteca-tandil'
    format :json
    
    resource :movies do 
      desc "Returns the movie index."
      get :index do
        Movie.limit(20)
      end

      desc "Returns the last movie"
      get :featured_movie do 
        Movie.last
      end

      desc "Returns a movie"
      params do
        requires :id, type: Integer, desc: "movie id"
      end
      route_param :id do
        get do
          Movie.find_by_id(params[:id])
        end
      end	
    end

    resource :categories do
      desc "Returns the categories index."
      get :index do
      	Category.all
      end

      desc "Returns Movies by category"
      params do
      	requires :id, type: Integer, desc: 'category id'
      end
      route_param :id do
      	get do
      	  Category.find_by_id(params[:id]).movies
      	end
      end
    end
  end
end