module Netzke
  module ControllerExtensions
    def self.included(base)
      base.send(:before_filter, :set_session_data)
    end
    
    def set_session_data
      Netzke::Base.session = session
      session[:netzke_user_id] = defined?(current_user) ? current_user.try(:id) : nil
      # set netzke_just_logged_in and netzke_just_logged_out states (may be used by Netzke widgets)
      if session[:_netzke_next_request_is_first_after_login]
        session[:netzke_just_logged_in] = true
        session[:_netzke_next_request_is_first_after_login] = false
      else
        session[:netzke_just_logged_in] = false
      end

      if session[:_netzke_next_request_is_first_after_logout]
        session[:netzke_just_logged_out] = true
        session[:_netzke_next_request_is_first_after_logout] = false
      else
        session[:netzke_just_logged_out] = false
      end
    end
  end
end