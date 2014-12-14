require 'spec_helper'

describe 'POST /universes' do
  let(:params){{ title:'Malazan' }}
  let(:function){ post '/universes', params }
  let(:body){ JSON.parse function.body }

  context "success" do
    it{ expect{function}.to change(
      Universe,:count).by(1) }
      
    context "response" do
      it{ expect(body).to eq({
        "id" => Universe.first.id,
        "title" => 'Malazan' }) }
    end

    after{ Universe.delete_all }
  end

  context "failure" do
    let(:params){ {} }
    it{ expect{function}.to_not change(
      Universe,:count) }

    context "response" do
      it{ expect(body).to have_key 'error' }
    end
  end

end
