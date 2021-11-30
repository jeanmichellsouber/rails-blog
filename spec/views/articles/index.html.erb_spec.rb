require "rails_helper"

RSpec.describe "articles/index" do
  it "renders the index template" do
    assign(:articles, [Article.create!(:status => 'public', :title => 'title testing', :body => 'at least 10 characters')])
    render

    expect(view).to render_template(:index)
    expect(view).to render_template("index")
    expect(view).to render_template("articles/index")
  end

  it "does not render a different template" do
    expect(view).to_not render_template("articles/show")
  end
end