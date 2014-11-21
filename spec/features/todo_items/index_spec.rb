require 'spec_helper'

describe "Viewing todo items" do 
	let(:todo_list) { ToDo.create(title: "Grocery list", description: "Groceries") }
	it "displays no items when todo list is empty" do 
		visit "/to_dos"
	end
end