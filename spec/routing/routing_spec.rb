require "rails_helper"

RSpec.describe "routes for Articles", :type => :routing do
    it "routes /articles to the articles controller" do
        expect(get("/articles")).to route_to("articles#index")
    end
    
    it "routes /articles to NOT route to another controller#action" do
        expect(get("/articles")).to_not route_to("article#index")
    end

    it "routes articles/test to the correct controller, method, index" do
        expect(get("/articles/test")).to route_to(
            :controller => "articles",
            :action => "show",
            :id => "test",
          )
    end
end