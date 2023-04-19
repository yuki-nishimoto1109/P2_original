class Book < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title, presence:true
  validates :body, presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  scope :created_days_ago, ->(n) { where(created_at: n.days.ago.all_day) }

  def self.created_days_ago_user(n,user)
    if n.present?
      where(created_at: n.to_time.all_day).where(user_id: user).count
    end
  end

  def self.past_week_count
   (0..6).map { |n| created_days_ago(n).count }.reverse
  end

end
