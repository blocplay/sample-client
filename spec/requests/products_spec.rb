# spec/requests/books_spec.rb
require 'rails_helper'

RSpec.describe 'products', type: :request do
  let(:api_key) { create(:api_key) }
  let(:keys) { Base64.encode64("#{api_key.id}:#{api_key.key}") }
  let(:headers) { { 'HTTP_AUTHORIZATION' => "PLAYShop #{keys}" } }

  let(:game_1) { create(:product, name: 'TokenPlay Game 1') }
  let(:game_2) { create(:product, name: 'TokenPlay Game 2') }
  let(:game_3) { create(:product, name: 'TokenPlay Game 3') }
  let(:games) { [game_1, game_2, game_3] }

  before do
    allow_any_instance_of(User).to receive(:provider_user_id).and_return('PLAYShop/test')
  end

  describe 'GET /api/products.get' do
    include_examples 'client auth', '/api/products.get'

    context 'authenticated' do
      before do
        games
        post '/api/products.get', headers: headers
      end

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it "receives a json with the 'success' root key" do
        expect(json_body['success']).to eq true
      end

      it "receives a json with the 'version' root key" do
        expect(json_body['version']).to eq '1'
      end

      it 'receives all 3 products in a list' do
        expect(json_body['data']['object']).to eq 'list'
        expect(json_body['data']['data']).to_not be nil
        expect(json_body['data']['data'].size).to eq 3
      end

      it 'receives 3 formatted products' do
        expect(json_body['data']['data']).to eq [
          {
            'object' => 'product',
            'id' => game_1.id.to_s,
            'name' => 'TokenPlay Game 1',
            'description' => 'Something cool',
            'image_url' => '',
            'price' => 1900,
            'currency' => 'THB'
          },
          {
            'object' => 'product',
            'id' => game_2.id.to_s,
            'name' => 'TokenPlay Game 2',
            'description' => 'Something cool',
            'image_url' => '',
            'price' => 1900,
            'currency' => 'THB'
          },
          {
            'object' => 'product',
            'id' => game_3.id.to_s,
            'name' => 'TokenPlay Game 3',
            'description' => 'Something cool',
            'image_url' => '',
            'price' => 1900,
            'currency' => 'THB'
          }
        ]
      end
    end
  end
end
