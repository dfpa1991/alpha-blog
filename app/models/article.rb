class Article < ApplicationRecord
  # Validations: Title and description cannot be nil
  validates :title, presence: true, length: { minimum: 6, maximum: 200 }
  validates :description, presence: true, length: { minimum: 15, maximum: 2000 }
end