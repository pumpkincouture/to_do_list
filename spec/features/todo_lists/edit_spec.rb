require 'spec_helper'

describe "Editing to do lists" do 

  it "updates a to do list successfully with correct information" do 
  	todo_list = Todo.create(title: "Groceries", description: "Grocery list.")

    visit "/to_dos"
    within "#to_dos_#{to_dos.id}" do 
    	click_link("Edit")
    end

    fill_in "Title", with: "New title"
    fill_in "Description", with: "New description"
    click_button "Update To do"

    todo_list.reload

    expect(page).to have_content("To do was successfully updated.")
    expect(to_do.title).to eq("New title")
    expect(to_do.description).to eq("New description")
  end
end