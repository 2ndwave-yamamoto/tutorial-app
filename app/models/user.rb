# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    # ハッシュ化したパスワード
    has_secure_password

    has_many :likes, dependent: :destroy
    has_many :blogs, dependent: :destroy
    has_many :like_blogs, through: :likes, source: :blog
    def already_liked?(blog)
        self.likes.exists?(blog_id: blog.id)
    end
end
