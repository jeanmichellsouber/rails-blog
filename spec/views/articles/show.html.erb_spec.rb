require "rails_helper"

RSpec.describe "articles/show" do
    it "displays the article with id: title-testing" do
        article = Article.create!(:status => 'public', :title => 'title testing', :body => 'at least 10 characters')
        # ID in this case is the friendly_id because of the GEM installed for friendly URLs
        controller.extra_params = { :id => article.friendly_id }

        # expecting SHOW view to have the correct PATH (URL)
        expect(controller.request.fullpath).to eq article_path(article)
    end
end