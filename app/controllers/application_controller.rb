require 'digest/md5'
class ApplicationController < ActionController::Base
  # basic認証機能、カリキュラムコピペ、変数のみcredentialsから取り出すものに変更
  
  # before_action :basic_auth
  # protect_from_forgery with: :exception

  # private

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     # username == 'admin' && password == '2222'
  #     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]

  #     # username == Rails.application.credentials.basic_auth[:user] && password == Rails.application.credentials.basic_auth[:password]
  #   end
  # end


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
