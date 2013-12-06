require 'spec_helper'

describe "books/new" do
  before(:each) do
    assign(:book, stub_model(Book,
      :title => "MyString",
      :author_id => 1,
      :ISBN_10 => 1,
      :ISBN_13 => 1
    ).as_new_record)
  end

  it "renders new book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", books_path, "post" do
      assert_select "input#book_title[name=?]", "book[title]"
      assert_select "input#book_author_id[name=?]", "book[author_id]"
      assert_select "input#book_ISBN_10[name=?]", "book[ISBN_10]"
      assert_select "input#book_ISBN_13[name=?]", "book[ISBN_13]"
    end
  end
end
