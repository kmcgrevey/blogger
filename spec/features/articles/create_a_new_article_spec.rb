require 'rails_helper'

RSpec.describe "Create new article", type: :feature do
  describe "when I link from articles index" do
    describe " I fill in title and body" do
      it "creates new article" do
        visit '/articles'

        click_on "Create a New Article"

        expect(current_path).to eq('/articles/new')

        fill_in :title, with: "New Title!"
        fill_in :body, with: "New body."
        click_on "Create Article"

        # expect(current_path).to eq('/articles/:id')

        expect(page).to have_content("New Title!")
        expect(page).to have_content("New body.")
      end
    end
  end
end
