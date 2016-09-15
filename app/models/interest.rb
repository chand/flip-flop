class Interest < ActiveRecord::Base
  belongs_to :politician
  belongs_to :issue

  # validates :slug, presence: true

  # extend FriendlyId
  # friendly_id :politician_name, use: [:slugged, :finders]

end
