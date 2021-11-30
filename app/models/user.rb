# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
    # gem bcrypt rules for strong passwords
    has_secure_password
    
    validates :email, presence: true
end
