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
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
