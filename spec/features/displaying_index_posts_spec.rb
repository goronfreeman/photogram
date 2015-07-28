require 'rails_helper'

feature 'Can see a list of posts on the index' do
  background do
    user = create :user
    post_one = create(:post, user_id: user.id, caption: 'This is post one')
    post_two = create(:post, user_id: user.id, caption: 'This is the second post')
    sign_in_with(user)
  end

  scenario 'the index lists all posts' do
    expect(page).to have_content('This is post one')
    expect(page).to have_content('This is the second post')
    expect(page).to have_css("img[src*='coffee']")
  end
end
