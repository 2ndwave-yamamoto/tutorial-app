# == Schema Information
#
# Table name: lakes
#
#  id         :bigint           not null, primary key
#  lakes      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :integer
#  user_id    :integer
#
require 'test_helper'

class LakeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
