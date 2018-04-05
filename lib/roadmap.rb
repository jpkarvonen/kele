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
end