require 'rails_helper.rb'

describe 'Creating posts' do
  before do
    visit '/'
    click_link 'New Post'
  end
  
  it 'can create a job' do
    attach_file('Image', 'spec/files/images/coffee.png')
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.png']")
  end

  it 'needs an image to create a post' do
    fill_in 'Caption', with: 'No picture because whatevs'
    click_button 'Create Post'
    expect(page).to have_content('Halt, you fiend! You need an image to post here!')
  end
end
