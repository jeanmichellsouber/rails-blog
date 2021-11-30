require "rails_helper"

RSpec.describe RegistrationsController do
    describe "GET #new" do
        subject { get :new }

        it "renders the SIGN UP template" do
            expect(subject).to render_template(:new)
            expect(subject).to render_template("new")
            expect(subject).to render_template("registrations/new")
        end

        it "does not render a different template" do
            expect(subject).to_not render_template("registrations/create")
        end
    end
end