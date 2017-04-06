require 'spec_helper'

resource :universe do
  host 'http://localhost:3000'

  has_attribute :id, type: {number: :integer}
  has_attribute :name, type: :string
  has_attribute :real_name, type: :string

  get '/universes', collection: true do
    respond_with :ok
  end

  post '/universes' do
    respond_with :created, universe: {name: 'DC'}
    respond_with :unprocessable_entity, universe: {name: nil}
  end
end