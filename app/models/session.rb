class Session < ApplicationRecord
    # ハッシュ化したパスワード
    has_secure_password
    validates :password, presence: true
    validates :name, presence: true
end