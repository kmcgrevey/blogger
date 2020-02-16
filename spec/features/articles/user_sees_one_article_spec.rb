require 'rails_helper'

RSpec.describe "View one article", type: :feature do
  describe "when I click on articles index" do
    it " displays info for one article" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")

      visit '/articles'

      click_link article_1.title

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
    end
  end
end
