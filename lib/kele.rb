require 'httparty'
require 'json'

class Kele
    include HTTParty
    
    base_uri 'https://www.bloc.io/api/v1'
    
    def initialize(e, p)
        response = self.class.post('/sessions', body: {
            email: e,
            password: p
        })
        
        @authorization_token = response["auth_token"]
        raise "Invalid Email or Password." if @authorization_token.nil?
    end
    
    def get_me
        response = self.class.get('/users/me', headers: { "authorization" => @authorization_token })
        JSON.parse(response.body)
    end
    
    def get_mentor_availability(id)
        response = self.class.get("/mentors/#{id}/student_availability", headers: { "authorization" => @authorization_token }) 
        JSON.parse(response.body)
    end
end
