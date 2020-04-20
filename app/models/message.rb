class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  after_commit { MessageRelayJob.perform_later(self) }
end
