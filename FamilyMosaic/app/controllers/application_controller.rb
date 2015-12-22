require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end
  def after_sign_in_path_for(resource)
    tree_path
  end
  def after_sign_up_path_for(resource)
    tree_path
  end
  # protected

  # def set_vary_header
  #   response.headers['Vary'] = 'Accept'
  # end
end