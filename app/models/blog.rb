# == Schema Information
#
# Table name: blogs
#
#  id              :bigint           not null, primary key
#  body(本文)      :text(65535)      not null
#  title(タイトル) :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Blog < ApplicationRecord
    validates :title, presence: true, length: { minimum: 1, maximum: 50}
    validates :body, presence: true, length: { minimum:10, maximum: 5000 }
end
