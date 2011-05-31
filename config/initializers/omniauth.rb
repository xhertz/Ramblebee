Rails.application.config.middleware.use OmniAuth::Builder do
provider :facebook, "175326695854719", "9dc6dfb261d7706e4bb1b1f26617ef8f",
       {:scope => 'email, offline_access', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
end