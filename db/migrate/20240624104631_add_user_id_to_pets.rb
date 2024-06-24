class AddUserIdToPets < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :user_id, :integer
  end
end
