class Assignment < ApplicationRecord
    has_one_attached :image
    has_rich_text :description

    validates :title, :description, :subject, :week_number, :due_date, :related_link, presence: true
    validates :due_date, uniqueness: true
    validate :image_format, if: -> { image.attached? }


    private

  def image_format
    if !image.content_type.in?(%w[image/jpeg image/png])
      errors.add(:image, "must be a JPEG or PNG file")
    end
  end
end
