require 'rails_helper'

describe "Creating new post", :type => :feature, js: true do

    it "click 'New Post' link opens new post form" do
        visit '/posts'
        click_link 'New Post'
        expect(page).to have_content 'New Post Title Body Back'
        expect(page).to have_button 'Create Post'
        expect(page).not_to have_css '#notice'
    end

    it "creates new post" do
        visit '/posts/new'
        fill_in 'Title', with: 'Ilya\'s test post'
        fill_in 'Body', with: 'Hello World! This is my test post!'
        click_button 'Create Post'
        expect(page).to have_content 'Post was successfully created'
        expect(page).to have_css '#notice'
    end


end