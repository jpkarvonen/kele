module Roadmap
    def get_roadmap(chain_id)
        get("/roadmaps/#{chain_id}")
    end
    
    def get_checkpoint(checkpoint_id)
        get("/checkpoints/#{checkpoint_id}")
    end
end