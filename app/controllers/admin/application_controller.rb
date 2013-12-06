module Admin
  class ApplicationController < ActionController::Base
    layout "admin/application"
    before_filter :require_user
    before_filter :require_admin

    def require_user
      if current_user.blank?
        respond_to do |format|
          format.html  {
            authenticate_user!
          }
          format.all {
            head(:unauthorized)
          }
        end
      end
    end
    def require_admin
      if not Setting.admin_emails.include?(current_user.email)
        render_404
      end
    end
    def render_404
      render_optional_error_file(404)
    end
    def render_optional_error_file(status_code)
      status = status_code.to_s
      if ["404","403", "422", "500"].include?(status)
        render :template => "/errors/#{status}", :format => [:html], :handler => [:erb], :status => status, :layout => "application"
      else
        render :template => "/errors/unknown", :format => [:html], :handler => [:erb], :status => status, :layout => "application"
      end
    end

  end
end
