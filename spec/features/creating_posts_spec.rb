require 'rails_helper'

feature 'Creating posts' do
  background do
    user = create :user
    sign_in_with(user)

    visit '/'
    click_link 'New Post'
  end

  scenario 'can create a new post' do
    attach_file('Image', 'spec/files/images/coffee.png')
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee']")
    expect(page).to have_content('Arnie')
  end

  scenario 'a post needs an image to save' do
    fill_in 'Caption', with: 'No picture because whatevs'
    click_button 'Create Post'
    expect(page).to have_content('Halt, you fiend! You need an image to post here!')
  end
end
