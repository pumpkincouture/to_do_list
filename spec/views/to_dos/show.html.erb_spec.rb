require 'spec_helper'

describe "to_dos/show" do
  before(:each) do
    @to_do = assign(:to_do, stub_model(ToDo,
      :list => "List",
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/List/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
