class Session < ApplicationRecord
    # ハッシュ化したパスワード
    has_secure_password
end