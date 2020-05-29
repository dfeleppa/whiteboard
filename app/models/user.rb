class User < ActiveRecord::Base
    has_secure_password

    has_many :user_posts

    def heightfeet
                @user.height
    end

    def age
        age = Date.today.year - birthday.year
        age -= 1 if Date.today < birthday + age.years #for days before birthday
    end

end