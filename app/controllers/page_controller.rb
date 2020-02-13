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


end
