class AddImageToTwitterAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :twitter_accounts, :image, :string
  end
end
