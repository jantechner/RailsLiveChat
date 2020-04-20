class CreateChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.string :topic

      t.timestamps
    end
  end
end
