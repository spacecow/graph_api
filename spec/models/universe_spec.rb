require 'active_record'
require './config/database'
require './app/models/universe'

describe Universe do
  let(:title){ 'Malazan' }
  before{ @creation = lambda{ Universe.create title:title }}

  it{ expect{@creation.call}.to change(
    Universe,:count).by(1) }

  context "title is not set" do
    let(:title){ nil }
    it{ expect{@creation.call}.to raise_error{|e|
      expect(e).to be_a ActiveRecord::StatementInvalid
      expect(e.message).to match /doesn't have a default value/ 
    }} 
  end

  context "title is duplicated" do
    before{ @creation.call }
    it{ expect{@creation.call}.to raise_error{|e|
      expect(e).to be_a ActiveRecord::RecordNotUnique
      expect(e.message).to match /Duplicate entry/ 
    }} 
  end

  after{ Universe.delete_all }

end
