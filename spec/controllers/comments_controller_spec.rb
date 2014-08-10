require 'rails_helper'

describe CommentsController do
	let!(:question) { FactoryGirl.create :question }

	context "#create" do
		it "should create a comment with valid parameters" do
			expect{
				post :create, comment: { content: "bacon ipsum dolor sit amet", commentable_id: question.id, commentable_type: "Question" }
			}.to change(Comment, :count).by(1)
		end
		it "should not create a comment with invalid parameters" do
			expect{
				post :create, comment: { content: "", commentable_id: question.id, commentable_type: "Question" }
			}.not_to change(Comment, :count)
		end
	end
end