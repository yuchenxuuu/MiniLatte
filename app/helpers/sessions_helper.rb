module SessionsHelper

    #returns the current logged_in user
    def current_user
        if @current_user.nil?
            @current_user = User.find_by(id: session[:user_id])
        else
            @current_user
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def log_in(user)
        session[:user_id] = user.id
    end

    def log_out
        @current_user = nil
        session.delete(:user_id)
    end

    
end
