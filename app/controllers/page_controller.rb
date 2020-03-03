class PageController < ApplicationController
    

    def home
        render "home"
    end
    def contact
        @title = "Contact"
      end
      
    def about
    @title = "About"
    end
    
    def help
    @title = "Help"
    end

    def search
        render 'page/search'
    end
    # search for the course
    def do_search

        if params[:subject].blank?
             @courses = Course.where("name LIKE ?", "%#{params[:search_text]}%")
        else
             @courses = Subject.find(params[:subject]).courses.where("name LIKE ?", 
                            "%#{params[:search_text]}%")
        end
    end


end
