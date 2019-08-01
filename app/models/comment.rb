class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :message

  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
