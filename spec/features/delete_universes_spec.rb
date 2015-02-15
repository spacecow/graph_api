require 'spec_helper'

describe 'DELETE /universes' do
  let(:function){ delete '/universes' }
  let(:body){ JSON.parse function.body }

  context "success" do
    let(:universe){ FactoryGirl.create :universe, title:'Malazan' }
    before{ universe }

    it{ expect{function}.to change(
      Universe,:count).by(-1) }
    it{ expect(body["universes"].first["universe"]).to eq({
      "id" => universe.id,
      "title" => 'Malazan' }) }

    after{ Universe.delete_all }
  end

end
