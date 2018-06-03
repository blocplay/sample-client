FactoryBot.define do
  factory :access_token do
    token_digest nil
    accessed_at '2018-06-02 18:14:41'
    user
    api_key
  end
end
