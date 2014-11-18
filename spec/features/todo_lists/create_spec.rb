require 'spec_helper'

describe "Creating to do lists" do 
	def create_todo_list(options = {})
    options[:title] ||= "My todo list"
    options[:description] ||= "This is my todo list."

    visit "/to_dos"
    click_link "New To do"
    expect(page).to have_content("New to_do")

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Create To do"
	end

  it "redirects to to-do list index page on server launch" do 
  	create_todo_list
    expect(page).to have_content("My todo list")
  end

  it "displays error when to do has no title" do 
  	expect(ToDo.count).to eq(0)

  	create_todo_list(title: "")
    
    expect(page).to have_content("error")
  	expect(ToDo.count).to eq(0)    
  end

  it "displays error when to do has a title less than 3 characters" do 
  	expect(ToDo.count).to eq(0)

  	create_todo_list(title: "Hi")

    expect(page).to have_content("error")
  	expect(ToDo.count).to eq(0)    
  end

  it "displays error when to do has no description" do 
  	expect(ToDo.count).to eq(0)

  	create_todo_list(description: "Food")
  	
    expect(page).to_not have_content("Grocery list")
  	expect(ToDo.count).to eq(0)    
  end
end