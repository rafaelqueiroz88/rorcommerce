class ApplicationController < ActionController::API
    before_action :cors_preflight_check
    after_action  :cors_set_access_control_headers      
           
    attr_reader :current_api_user

    def authenticate_request
        self.current_api_user = AuthorizeApiRequest.call(request.headers).result

        render json: {  error: "Você não está autorizado" }, 
                        status: :unauthorized unless current_api_user
    end

    protected

    def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST,DELETE, GET, PUT, PATCH, OPTIONS'
      headers['Access-Control-Allow-Headers'] = '*'
      headers['Access-Control-Max-Age'] = "1728000"
    end    

    def cors_preflight_check
      if request.method == :options
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST,DELETE, GET, PUT, PATCH, OPTIONS'
        headers['Access-Control-Allow-Headers'] = '*'
        headers['Access-Control-Max-Age'] = '1728000'
        render :text => '', :content_type => 'text/plain'
      end
    end
end
