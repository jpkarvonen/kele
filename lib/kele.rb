require 'httparty'

class Kele
    include HTTParty
    debug_output $stdout
    
    def initialize(e, p)
        response = self.class.post('https://www.bloc.io/api/v1/sessions', body: {
            email: e,
            password: p
        })
        
        print response
        
        @authorization_token = response["auth_token"]
        raise "Invalid Email or Password." if @authorization_token.nil?
    end
end