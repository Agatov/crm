class Call < ActiveRecord::Base
  attr_accessible :client_id, :client, :comment, :date, :done, :reason

  belongs_to :client

  after_create :add_comment_to_client

  def add_comment_to_client
    client.add_comment("#{reason} \n \n #{comment}")
  end

end
