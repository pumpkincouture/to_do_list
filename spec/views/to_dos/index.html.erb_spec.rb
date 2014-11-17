require 'spec_helper'

describe "to_dos/index" do
  before(:each) do
    assign(:to_dos, [
      stub_model(ToDo,
        :list => "List",
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(ToDo,
        :list => "List",
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of to_dos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "List".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
