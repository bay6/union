class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: I18n.t("unauthorized.default")
  end

  def ongoing?
  end
end
