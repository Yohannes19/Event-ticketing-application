class AddConfirmableToUsers < ActiveRecord::Migration[6.1]
  # Note: You can't use change, as User.update_all will fail in the next step
  def up
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string # Only if using reconfirmable

    add_index :users, :confirmation_token, unique: true

    # All existing user accounts should be confirmed by default
    User.update_all confirmed_at: DateTime.now
  end

  def down
    remove_columns :users, :confirmed_at, :confirmation_token, :confirmation_sent_at, :unconfirmed_email
  end
end
