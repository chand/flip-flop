class Issue < ActiveRecord::Base
  has_many :interests
  has_many :politicians, through: :interests

  validates :name, :slug, :keywords, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
