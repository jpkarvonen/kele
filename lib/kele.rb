require 'httparty'
require 'json'
require './lib/roadmap'

class Kele
    include HTTParty
    include Roadmap
    
    base_uri 'https://www.bloc.io/api/v1'
    
    def initialize(email, password)
        response = self.class.post('/sessions', body: {
            email: email,
            password: password
        })
        
        @authorization_token = response["auth_token"]
        raise "Invalid Email or Password." if @authorization_token.nil?
    end
    
    def get(path)
        response = self.class.get(path, headers: { "authorization" => @authorization_token })
        JSON.parse(response.body)
    end
    
    def get_me
        get("/users/me")
    end
    
    def get_mentor_availability(id)
        get("/mentors/#{id}/student_availability")
    end
end