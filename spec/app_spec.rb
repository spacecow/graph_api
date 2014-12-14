require 'spec_helper'

describe 'POST /universes' do
  let(:function){ post('/universes', title:'Malazan') }

  it{ expect{function}.to change(
    Universe,:count).by(1) }
    
  context "response" do
    subject{ JSON.parse function.body }
    it{ is_expected.to eq({
      "id" => Universe.first.id,
      "title" => 'Malazan' }) }
  end

  after{ Universe.delete_all }
end
