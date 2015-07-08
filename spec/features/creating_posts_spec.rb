require 'rails_helper.rb'

describe 'Creating posts' do
  it 'can create a job' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/coffee.png')
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.png']")
  end
end
