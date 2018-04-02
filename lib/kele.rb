require 'httparty'

class Kele
    include HTTParty
    base_uri 'https://www.bloc.io/api/v1'
    
    def initialize(e, p)
        post_response = self.class.post( '/sessions', body: {
            email: e,
            password: p
        })
        
        @authorization_token = post_response['auth_token']
        
        raise "Invalid Email or Password." if @authorization_token.nil?
    end
end