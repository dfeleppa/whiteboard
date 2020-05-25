class User < ActiveRecord::Base
    has_secure_password

    has_many :journal

    def heightfeet
        @user.height
    end

end