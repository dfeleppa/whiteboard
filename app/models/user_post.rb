class UserPost < ActiveRecord::Base

    belongs_to :user

    def is_rx?
        
        if self.rx == true
            "rx"
        else
            "scaled"
        end
    end
end
