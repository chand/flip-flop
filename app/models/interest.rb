class Interest < ActiveRecord::Base
  belongs_to :politician
  belongs_to :issue

end
