# name: string
# email:string
# password_digest:string
# password_confirmation: string virtual
class Admin < ApplicationRecord
    has_secure_password

end
