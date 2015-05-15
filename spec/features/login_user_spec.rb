require 'spec_helper'

describe 'POST /login' do
  let(:function){ post '/login', {user:'tester', password:'secret'} }
  let(:body){ JSON.parse function.body }
  
  subject{ body }

  #TODO make email not null
  describe "success" do
    before{ FactoryGirl.create :user, password:'secret' }
    its(["success"]){ is_expected.to eq "User authenticated" }
    after{ User.delete_all }
  end

  describe "failure" do
    its(["error"]){ is_expected.to eq "Authentication failed" }
  end

end
