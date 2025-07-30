class Photo < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :title, presence: true, length: { maximum: 30 }
  validate :image_presence

  private

  def image_presence
    errors.add(:image, 'をアップロードしてください') unless image.attached?
  end
end
