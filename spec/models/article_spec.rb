require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'when creating article' do
    it 'cannot create comments along' do
      expect {Article.create.comments.create!.to raise_error(ActiveRecord::RecordInvalid)}
    end
    
    it "should validate the fields, because body is too short" do
      article = Article.create!(:status => 'public', :title => 'title testing', :body => 'hello world')
      expect {article.to raise_error(ActiveRecord::RecordInvalid)}
    end    
  end

  context "Creating comments after creating an article" do
    it "should show them correctly" do
      article = Article.create!(:status => 'public', :title => 'title testing', :body => 'at least 10 characters')
      comment1 = article.comments.create!(:status => 'public', :commenter => 'commenter', :body => "first comment with at least 10 characters")
      comment2 = article.comments.create!(:status => 'public', :commenter => 'commenter', :body => "first comment with at least 10 characters")
      expect(article.reload.comments).to eq([comment1, comment2])
      expect(article.reload.comments.count).to be 2
    end
  end
end
