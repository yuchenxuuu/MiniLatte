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

    def show_search
        render 'search'
    end


    def do_search
        if params[:subject][:subject_id].blank?
            @courses = Course.where("name LIKE ?", "%#{params[:course_name]}%")
        else
            @courses = Subject.find(params[:subject][:subject_id]).courses.where("name LIKE ?",
                                    "%#{params[:course_name]}%")
        end
        
        render 'search'
    end
  
    # search for the course
    # def get_result
    #     @enrollments = Enrollment.all
    #     if params[:subject].blank?
    #         @courses = Course.where("name LIKE ?", "%#{params[:search_text]}%")
    #         if @courses
    #             respond_to do |format|
    #                 format.js {render partial: 'page/showcourse'}
    #             end
    #         else
    #             flash[:alert] = "Please enter a valid course name."
    #             redirect_to search_path
    #         end
    #     else
    #          @courses = Subject.find(params[:subject]).courses.where("name LIKE ?", 
    #                         "%#{params[:search_text]}%")
    #         if @courses
    #             respond_to do |format|
    #                 format.js {render partial: 'page/showcourse'}
    #             end
    #         end
    #     end
    # end


end
