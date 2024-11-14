class Student < ApplicationRecord
    has_one_attached :image

    validates :name, :email, :repository_link, :page_link, :phone, :education, :image, presence: true
    validates :email, :phone, :repository_link, :page_link, uniqueness: true
    validate :image_format, if: -> { image.attached? }
    # def image_url
    #     image.attached? ? url_for(image) : nil
    # end

    private

    def image_format
      if !image.content_type.in?(%w[image/jpeg image/png])
        errors.add(:image, "must be a JPEG or PNG file")
      end
    end
end
