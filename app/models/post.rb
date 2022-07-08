class Post < ApplicationRecord
  validates :description, presence: true

  belongs_to :created_by, class_name: "User"

  has_many :likes, dependent: :destroy
  has_many :comments

  has_one_attached :photo

  validates :photos, attached: true, content_type: %i[png jpg jpeg], size: { less_than: 5.megabytes }

  def liked_by?(user)
    likes.where(user: user).exists?
  end
end
