require 'rails_helper'

RSpec.describe "Delete an article", type: :feature do
  describe "when I click in article show" do
      it "it is deleted from index" do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")
        article_2 = Article.create!(title: "Title 2", body: "Body 2")

        visit '/articles'

        expect(page).to have_content(article_1.title)
        expect(page).to have_content(article_2.title)

        click_link "#{article_1.title}"

        expect(current_path).to eq("/articles/#{article_1.id}")

        click_on "Delete Article"

        expect(current_path).to eq("/articles")
        expect(page).to_not have_content(article_1.title)
        expect(page).to have_content(article_2.title)

      end
    end
  end
