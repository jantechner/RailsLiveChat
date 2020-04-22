class AddDetailsToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :description, :string
  end
end
