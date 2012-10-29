require "./people.rb"

describe People do
  before do
    @people = People.new
  end

  describe "#find_all_names" do
    it "should return json" do 
      @people.find_all_names(:json).should == '["Dean Winchester","Michael Bluth","Timothy Barnes"]' 
    end
    it "should return ruby" do 
      @people.find_all_names.should == ["Dean Winchester", "Michael Bluth", "Timothy Barnes"]
    end
  end

  describe "#find" do
    it "returns json for name" do
      @people.find("Timothy Barnes", :json).should include '"name":"Timothy Barnes"'
    end
    it "returns ruby for name" do
      @people.find("Timothy Barnes").should include "name" => "Timothy Barnes"
    end
  end
end