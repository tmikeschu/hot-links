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
      old_count = db_link.read_count
        
      link = { link: { url: "http://turing.io" } }
      post "/api/v1/links", params: link

      db_link.reload

      expect(db_link.read_count).to eq old_count + 1
    end
  end

  describe "GET api/v1/hottest_links" do
    it "returns the 10 hottest links" do
      create_list(:link, 15)
      get "/api/v1/hottest_links" 

      expect(response).to be_success

      json_links = JSON.parse(response.body, symbolize_names: true)
      expect(json_links.count).to eq 10
    end
  end
end
