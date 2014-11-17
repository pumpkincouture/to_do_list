require 'spec_helper'

describe "to_dos/new" do
  before(:each) do
    assign(:to_do, stub_model(ToDo,
      :list => "MyString",
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new to_do form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", to_dos_path, "post" do
      assert_select "input#to_do_list[name=?]", "to_do[list]"
      assert_select "input#to_do_title[name=?]", "to_do[title]"
      assert_select "textarea#to_do_description[name=?]", "to_do[description]"
    end
  end
end
