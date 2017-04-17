require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:url) }
  end

  describe "Defaults" do
    it "starts with a read count of 1" do
      link = Link.create(url: "http://turing.io")
      expect(link.read_count).to eq 1
    end
  end

  describe "Scopes" do
    describe ".hottest" do
      it "returns the top 10 links by read count" do
        create_list(:link, 10)

        raw_ordered = Link.order("links.read_count DESC")
        scoped_ordered = Link.hottest

        expect(scoped_ordered.count).to eq 10
        scoped_ordered.each_with_index do |link, index|
          expect(link).to eq raw_ordered[index]
        end
        
        counts = scoped_ordered.pluck(:read_count)
        expect(counts.sort.reverse).to eq counts
      end

      it "accepts an arugment" do
        create_list(:link, 10)

        scoped_ordered = Link.hottest(5)

        expect(scoped_ordered.count).to eq 5
      end
    end
  end
end
