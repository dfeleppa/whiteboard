class UserPost < ActiveRecord::Base

    belongs_to :user

    def is_rx?
        
        if self.rx == true
            "RX"
        else
            "Scaled"
        end
    end
end
