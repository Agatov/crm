class Comment < ActiveRecord::Base
  attr_accessible :client_id, :content, :user_id

  belongs_to :client
end
