require "rails_helper"

RSpec.describe "Links API", type: :request do
  describe "POST api/v1/links" do
    it "adds a link to the database" do
      expect(Link.count).to eq 0

      link = { link: { url: "http://turing.io" } }
      post "/api/v1/links", params: link

      expect(response).to be_success
      expect(Link.count).to eq 1
    end

    it "and the read count starts at 1" do
      link = { link: { url: "http://turing.io" } }
      post "/api/v1/links", params: link

      expect(Link.last.read_count).to eq 1
    end

    it "updates the count if the link exists" do
      db_link = create(:link, url: "http://turing.io")
        
      link = { link: { url: "http://turing.io" } }
      post "/api/v1/links", params: link

      db_link.reload

      expect(db_link.read_count).to eq 2
    end
  end
end
