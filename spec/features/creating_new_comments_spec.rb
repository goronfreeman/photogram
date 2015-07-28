require 'rails_helper'

feature 'Creating comments' do
  scenario 'can comment on an existing post' do
    user = create :user
    post = create(:post, user_id: user.id)
    sign_in_with(user)

    visit '/'
    fill_in 'Add a comment...', with: ';P'
    click_button 'Submit'
    # expect(page).to have_css("div.comments#{post.id}", text: ';P')
  end
end
