require "rails_helper"

RSpec.feature "Visitor views root page" do

  describe "As a visitor on the root page" do
    it "I can see a list of the top-10 most read links" do
      create_list(:link, 10)

      visit root_path

      Link.hottest.each_with_index do |link, index|
        expect(page).to have_content "#{index + 1}. #{link.url}"
      end
    end
  end
end
