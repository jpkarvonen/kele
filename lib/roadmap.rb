module Roadmap
    def get_roadmap(chain_id)
        get("/roadmaps/#{chain_id}")
    end
    
    def get_checkpoint(checkpoint_id)
        get("/checkpoints/#{checkpoint_id}")
    end
    
    def get_messages(page = nil)
        if page != nil 
            message_url = "/message_threads?page=#{page}"
        else
            message_url = "/message_threads"
        end
        get(message_url)
    end
    
    def create_message(sender, recipient_id, subject, stripped_text, token = nil)
        response = self.class.post("/messages", headers: { "authorization" => @authorization_token }, body: {
            "sender": sender,
            "recipient_id": recipient_id,
            "token": token,
            "subject": subject, 
            "stripped_text": stripped_text
        })
        puts "Your message sent!" if response.success?
    end
    
    def remaining_checkpoints(chain_id)
        get("/enrollment_chains/#{chain_id}/checkpoints_remaining_in_section")
    end
end
