class Public::ApplicationController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
   def after_sign_in_path_for(resource)
      my_page_path
    end
    
    def after_sign_out_path_for(resource)
      new_customer_session
    end
end