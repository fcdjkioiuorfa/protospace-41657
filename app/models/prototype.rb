class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :catchphrase, presence: true
  validates :concept, presence: true
  validates :image, presence: true

  
end
