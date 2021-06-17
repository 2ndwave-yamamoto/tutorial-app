# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  impressions_count :integer          default(0)
#  name              :string(255)
#  password_digest   :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class User < ApplicationRecord
    has_secure_password
    has_many :blog 
    has_many :comments
    has_many :likes, dependent: :destroy
    has_many :blogs, dependent: :destroy
end
