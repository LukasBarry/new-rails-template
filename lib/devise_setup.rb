def devise_controller_setup
  insert_into_file 'app/controllers/application_controller.rb', after: "protect_from_forgery with: :exception\n" do <<-RUBY
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :admin])
  end
  RUBY
  end
end
