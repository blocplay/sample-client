FactoryBot.define do
  factory :product do
    name 'TokenPlay Game'
    description 'Something cool'
    price Money.new(1900, 'THB')
  end
end
