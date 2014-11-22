require 'spec_helper'

describe "Viewing todo items" do 
	let(:todo_list) { ToDo.create(title: "Grocery list", description: "Groceries") }
	it "displays no items when todo list is empty" do 
		visit "/to_dos"
		within '#todo_list_#{todo_list.id}' do 
			click_link "List Items"
		end
		expect(page).to have_content("TodoItems#index")
	end
end