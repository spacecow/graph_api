require 'spec_helper'

describe 'GET /universes' do
  let(:function){ get '/universes' }
  let(:body){ JSON.parse function.body }

  context "success" do
    before{ Universe.create title:'Malazan' }
    context "response" do
      it{ expect(body["universes"]).to eq([{
        "id" => Universe.first.id,
        "title" => 'Malazan' }]) }
    end
    after{ Universe.delete_all }
  end
end
