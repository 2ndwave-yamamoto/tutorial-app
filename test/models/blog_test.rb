# == Schema Information
#
# Table name: blogs
#
#  id                  :bigint           not null, primary key
#  body(本文)          :text(65535)      not null
#  impressions_count   :integer          default(0)
#  title(タイトル)     :string(255)      not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#
require 'test_helper'

class BlogTest < ApplicationRecord

end
