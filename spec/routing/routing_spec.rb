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

RSpec.describe "routes for SIGN_UP / SIGN_IN", :type => :routing do
    it "routes /sign_up to the correct controller and action" do
        expect(get("/sign_up")).to route_to("registrations#new")
    end
    it "routes /sign_up to the correct controller and action" do
        expect(get("/sign_up")).to_not route_to("registrations#create")
    end
    
    it "routes /log_in to the correct controller and action" do
        expect(get("/log_in")).to route_to("sessions#new")
    end
    it "routes /log_in to the correct controller and action" do
        expect(get("/log_in")).to_not route_to("sessions#create")
    end
end