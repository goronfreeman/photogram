require 'rails_helper'

feature 'deleting posts' do
  background do
    user = create :user
    post = create(:post, user_id: user.id, caption: 'Abs for days')
    sign_in_with(user)

    find(:xpath, "//a[contains(@href, 'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'can delete a post' do
    click_link 'Delete Post'

    expect(page).to have_content('Problem solved! Post deleted.')
    expect(page).to_not have_content('Abs for days')
  end
end
