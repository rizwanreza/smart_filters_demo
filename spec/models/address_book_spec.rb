require "spec_helper"

describe AddressBook do
  describe ".smart_filter" do
    let(:bob) { Factory(:address_book, :name => "Bob Martin") }
    let(:david) { Factory(:address_book, :name => "David Henderson") }

    it "returns nil if the criteria is unknown" do
      AddressBook.smart_filter({:name => {"magic" => "abracadabra"}}).should be_nil
    end

    context "when the column to apply smart filtering is string or text" do
      context "when the criteria is 'contains'" do

        it "returns the record with the column that contains the given string" do
          AddressBook.smart_filter({:name => {"contains" => "Bob"}}).each do |a|
            a.name.should == bob.name
            bob.name.should include(bob.name.split.first)
          end
        end

      end

      context "when the criteria is 'is'" do

        it "returns the record with the column of the exact given string" do
          AddressBook.smart_filter({:name => {"is" => "Bob Martin"}}).each do |a|
            a.name.should == bob.name
          end
        end

      end

      context "when the criteria is 'does_not_contain'" do

        it "returns the record with the column that does not contain the given string" do
          AddressBook.smart_filter({:name => {"does_not_contain" => "Bob Martin"}}).each do |a|
            a.name.should_not == bob.name
          end
        end

      end

      context "when the criteria is starts_with" do

        it "returns the record with the column that starts with the given string" do
          AddressBook.smart_filter({:name => {"starts_with" => "David"}}).each do |a|
            a.name.should =~ /^David[.]*/
          end
        end

      end

      context "when the criteria is ends_with" do

        it "returns the record with the column that ends with the given string" do
          AddressBook.smart_filter({:name => {"ends_with" => "Henderson"}}).each do |a|
            a.name.should =~ /[.]*Henderson$/
          end
        end

      end

    end

    context "when the column to apply smart filtering is integer" do
      
    end

    context "when the column to apply smart filtering is boolean" do
      
    end

    context "when the column to apply smart filtering is date or date/time" do
      
    end

  end
end