class ApplicationController < ActionController::API
  #before_action :check_header
  before_action :authenticate_request

  attr_reader :current_user

  private
  def check_header
  if ['POST','PUT','PATCH'].include? request.method
    if request.content_type != "application/vnd.api+json"
      head 406 and return
    end
  end
end

def validate_type
    if params['data'] && params['data']['type']
      if params['data']['type'] == params[:controller]
        return true
      end
    end
    head 409 and return
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
