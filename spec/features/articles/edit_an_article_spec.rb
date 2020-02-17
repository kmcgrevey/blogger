require 'rails_helper'

RSpec.describe "Edit an article", type: :feature do
  describe "when I link from article show" do
    describe "I edit a field" do
      it "creates updated article" do
        article_1 = Article.create!(title: "Title 1", body: "This is a mistake!")

        visit "/articles/#{article_1.id}"

        expect(page).to have_content("This is a mistake!")

        click_on "Edit"

        expect(current_path).to eq("/articles/#{article_1.id}/edit")

        fill_in :title, with: "Changed Title!"
        fill_in :body, with: "Corrected."
        click_on "Update Article"

        expect(current_path).to eq("/articles/#{article_1.id}")

        expect(page).to have_content("Changed Title!")
        expect(page).to have_content("Corrected.")
        expect(page).to_not have_content("Title 1")
        expect(page).to_not have_content("This is a mistake!")
        # expect(page).to have_content("Article '#{article_1.title}' Updated!")
      end
    end
  end
end
