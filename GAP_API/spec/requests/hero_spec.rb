require 'spec_helper'

resource :heroe do
  host 'http://localhost:3000'

  has_attribute :id, type: {number: :integer}
  has_attribute :name, type: :string
  has_attribute :real_name, type: :string

  get 'http://localhost:3000/heroes', collection: true do
    respond_with :ok
  end

  post '/heroes' do
    respond_with :created, hero: {name: 'Superman'}
    respond_with :unprocessable_entity, hero: {name: nil}
  end
end