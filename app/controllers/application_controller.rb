require 'digest/md5'

class ApplicationController < ActionController::Base

    before_action :authenticate
    
    username = Rails.application.credentials.basic_auth[:user]
    password = Rails.application.credentials.basic_auth[:password]
  
    REALM = 'SecretZone'.freeze
    USERS = { username => Digest::MD5.hexdigest([username, REALM, password].join(':'))}.freeze
  
    private
  
    def authenticate
      authenticate_or_request_with_http_digest(REALM) do |username|
        USERS[username]
      end
    end

end
