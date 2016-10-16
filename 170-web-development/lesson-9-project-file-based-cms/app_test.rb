ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"
require 'pry'
require_relative "app"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.txt"
    assert_includes last_response.body, "changes.txt"
    assert_includes last_response.body, "history.txt"
    assert_includes last_response.body, "markdown.md"

  end

  def test_get_single_file
    get "/about.txt"
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "HELLO THERE IM ABOUT"
  end

  def test_gets_doc_not_exist
    get "/notafile.ext"
    assert_equal 302, last_response.status
    get last_response["Location"]
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "notafile.ext does not exist."
  end

  def test_markdown_converts_to_html
    get "/markdown.md"
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
  end

  def test_edit_link_visible
    get '/'
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, %q(<a href="about.txt/edit">Edit</a>)
  end

  def test_edit_page
    get '/about.txt/edit'
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, %q(<input type="submit")
  end

  def test_editing_document
    post('/changes.txt/edit', {content: "new content"})
    assert_equal 302, last_response.status

    get last_response["Location"]

    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "changes.txt has been updated."
    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "new content"
  end
end