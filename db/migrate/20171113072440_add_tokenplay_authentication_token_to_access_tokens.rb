class AddtokenplayAuthenticationTokenToAccessTokens < ActiveRecord::Migration[5.1]
  def change
    add_column :access_tokens, :tokenplay_authentication_token, :string
  end
end
