require 'spec_helper'

feature 'User creates todo' do
  scenario 'successfully with a title' do
    sign_in

    fill_in 'Title', with: 'Buy milk'
    click_on 'Create Todo'

    within 'ul.todos' do
      expect(page).to have_css 'li', text: 'Buy milk'
    end
  end

  def sign_in
    visit root_path
    fill_in 'Email', with: 'person@example.com'
    click_on 'Sign in'
  end
end
