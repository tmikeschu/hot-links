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
end
