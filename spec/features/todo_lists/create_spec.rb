require 'spec_helper'

describe "Creating to do lists" do 
  it "redirects to to-do list index page on server launch" do 
    visit "/to_dos"
    click_link "New To do"
    expect(page).to have_content("New to_do")

    fill_in "Title", with: "My todo list"
    fill_in "Description", with: "This is what I'm doing today."
    click_button "Create To do"

    expect(page).to have_content("My todo list")
  end
  it "displays error when to do has no title" do 
  	expect(ToDo.count).to eq(0)

  	 visit "/to_dos"
    click_link "New To do"
    expect(page).to have_content("New to_do")

    fill_in "Title", with: ""
    fill_in "Description", with: "This is what I'm doing today."
    click_button "Create To do"

    expect(page).to have_content("error")
  	expect(ToDo.count).to eq(0)    
  end
  it "displays error when to do has a title less than 3 characters" do 
  	expect(ToDo.count).to eq(0)

  	 visit "/to_dos"
    click_link "New To do"
    expect(page).to have_content("New to_do")

    fill_in "Title", with: "Hi"
    fill_in "Description", with: "This is what I'm doing today."
    click_button "Create To do"

    expect(page).to have_content("error")
  	expect(ToDo.count).to eq(0)    
  end
end