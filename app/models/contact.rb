class Contact < ApplicationRecord
    validates :name, :email, :message, presence: true

    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

    validates :message, length: { in: 10..500 }
end
