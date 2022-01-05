require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('visits home page', {:type => :feature}) do
  it('should visit the home page') do
    visit('/')
    expect(page).to have_content('Word Definitions')
  end
end

describe 'adds a new word', {:type => :feature} do
  it 'the user can create a new word and it will be listed' do
    visit '/'
    click_link('Add a new word')
    fill_in('word_name', :with => 'shoe')
    click_button('Go!')
    expect(page).to have_content('shoe')
  end
end

describe 'the word updating path', {:type => :feature} do
  it 'the user can edit the word' do
    visit '/'
    click_link('shoe')
    click_link('Edit word')
    fill_in('name', :with => 'boot')
    click_button('Update')
    expect(page).to have_content('boot')
  end
end

describe 'the definition adding path', {:type => :feature} do
  it 'the user can add definitions to a word' do
    visit '/'
    click_link('boot')
    fill_in('definition_name', :with => 'a glove but for feet')
    click_button('Add definition')
    expect(page).to have_content('a glove but for feet')
  end
end

describe 'the definition updating path', {:type => :feature} do
  it 'the user can edit the definition' do
    visit '/'
    click_link('boot')
    click_link('a glove but for feet')
    fill_in('name', :with => 'big shoes')
    click_button('Update definition')
    expect(page).to have_content('big shoes')
  end
end

describe 'the definition deleting path', {:type => :feature} do
  it 'the user can delete a definition' do
    visit '/'
    click_link('boot')
    click_link('big shoes')
    click_button('Remove Definition')
    expect(page).to_not have_content('big shoes')
  end
end

describe 'the word deleting path', {:type => :feature} do
  it 'the user can delete a word' do
    visit '/'
    click_link('boot')
    click_link('Edit word')
    click_button('Delete word')
    expect(page).not_to have_content('boot')
  end
end