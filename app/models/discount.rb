class Discount < ApplicationRecord
  # Shrine pour l'upload d'image
  include ImageUploader::Attachment(:image)

  # Validations des champs
  validates :title, presence: true
  validates :email, presence: true
  validates :expiration_date, presence: true
  validate  :expiration_at_least_30_days_from_now
  validates :image, presence: true

  private

  def expiration_at_least_30_days_from_now
    return if expiration_date.blank?
    if expiration_date < Date.today + 30
      errors.add(:expiration_date, "must be at least 30 days in the future")
    end
  end
end
