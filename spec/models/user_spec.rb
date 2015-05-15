require 'active_record'
require './config/database'
require './app/models/user'

describe User do
  
  #TODO make test for create :user
  context "validation" do
    context "" do
      #it{ expect(User.new.save).to be false  }
      it{ expect(User.new.valid?).to be true }
      it{ expect{User.create}.to raise_error{|e|
        expect(e).to be_a ActiveRecord::StatementInvalid
        expect(e.message).to match /doesn't have a default value/ 
      }}
    end
  end

end
