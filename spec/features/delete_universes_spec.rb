require 'spec_helper'

describe 'DELETE /universes' do
  let(:function){ delete '/universes' }
  let(:body){ JSON.parse function.body }

  context "success" do
    before{ FactoryGirl.create :universe }
    it{ expect{function}.to change(
      Universe,:count).by(-1) }
    it{ expect(body).to be_empty }
    after{ Universe.delete_all }
  end

end
