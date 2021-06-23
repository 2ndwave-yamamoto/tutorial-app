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
class Blog < ApplicationRecord
    validates :title, presence: true, length: { minimum: 1, maximum: 50}
    validates :body, presence: true, length: { minimum:10, maximum: 5000 }
    belongs_to  :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    # ページカウント
    is_impressionable counter_cache: true
    
    # 検索機能
    scope :search, ->(params) do
      scope = self
      scope = scope.search_by_title(params[:search_title]) if params[:search_title].present?
      scope = scope.search_by_created_at(params[:search_created_at]) if params[:search_created_at].present?
      scope
    end
    
    scope :search_by_title, -> (value) do
      where("`title` LIKE ?", "%#{value}%")
    end

    scope :search_by_created_at, -> (value) do
      where("DATE(`created_at`) = ?", value.to_date)
    end
end
