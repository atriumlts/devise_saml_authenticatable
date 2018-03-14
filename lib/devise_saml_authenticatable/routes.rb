# Source: https://github.com/5rabbits/devise_saml_authenticatable/blob/2c03bc95e3f4d91d28421c3cb8ecb260f8198178/lib/devise_saml_authenticatable/routes.rb

ActionDispatch::Routing::Mapper.class_eval do
  protected

  def devise_saml_authenticatable(mapping, controllers)
    resource :session, only: [], controller: controllers[:saml_sessions], path: '' do
      get :new, path: 'saml/sign_in', as: :new_user_saml_session
      post :create, path: 'saml/auth', as: :user_saml_session
      match :destroy, path: mapping.path_names[:sign_out], as: :destroy_user_saml_session, via: mapping.sign_out_via
      get :metadata, path: 'saml/metadata', as: :metadata_user_saml_session
      match :idp_sign_out, path: 'saml/idp_sign_out', via: %i[get post]
    end
  end
end
