require 'spec_helper'

describe "tlab/posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Tlab::Post,
      :title => "MyString",
      :preview => "MyString",
      :author => nil
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "input#post_title[name=?]", "post[title]"
      assert_select "input#post_slug[name=?]", "post[slug]", 1
      assert_select "textarea#post_body[name=?]", "post[body]"
      assert_select "textarea#post_preview[name=?]", "post[preview]"
    end
  end
end
