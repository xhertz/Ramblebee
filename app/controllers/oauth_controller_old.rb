class OauthController < ApplicationController

def start 

  redirect_to client.authorize_url(
    :client_id => "b1706b8a225e578b1d9fc0170799655a", 
    :redirect_uri => "http://almalogic.dev", 
    :scope => 'email')
end
 
def passthru
  render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
end	 
 
def callback
  access_token = client.get_token(params[:code], :redirect_uri => "http://almalogic.dev")
 session[:fb_user] = JSON.parse access_token.get('/me')
  # store the access_token.token value as well as any user info you wanted
 
  redirect_to :controller => :users, :action => :login_process_facebook, :token => access_token.token
 
end

protected
  def client
    @client ||= OAuth2::Client.new(
        "b1706b8a225e578b1d9fc0170799655a", "9dc6dfb261d7706e4bb1b1f26617ef8f",
        :site => 'https://graph.facebook.com'
    )
  end
end

