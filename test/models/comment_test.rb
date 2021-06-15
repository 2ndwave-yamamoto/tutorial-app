# == Schema Information
#
# Table name: comments
#
#  id                 :bigint           not null, primary key
#  body(コメント本文) :text(65535)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  blog_id            :bigint
#  user_id            :integer
#
# Indexes
#
#  index_comments_on_blog_id  (blog_id)
#
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
