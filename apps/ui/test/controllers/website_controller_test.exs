defmodule Ui.WebsiteControllerTest do
  use Ui.ConnCase

  alias Ui.Website
  @valid_attrs %{content: "some content", name: "some content", url: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, website_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing websites"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, website_path(conn, :new)
    assert html_response(conn, 200) =~ "New website"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, website_path(conn, :create), website: @valid_attrs
    assert redirected_to(conn) == website_path(conn, :index)
    assert Repo.get_by(Website, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, website_path(conn, :create), website: @invalid_attrs
    assert html_response(conn, 200) =~ "New website"
  end

  test "shows chosen resource", %{conn: conn} do
    website = Repo.insert! %Website{}
    conn = get conn, website_path(conn, :show, website)
    assert html_response(conn, 200) =~ "Show website"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, website_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    website = Repo.insert! %Website{}
    conn = get conn, website_path(conn, :edit, website)
    assert html_response(conn, 200) =~ "Edit website"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    website = Repo.insert! %Website{}
    conn = put conn, website_path(conn, :update, website), website: @valid_attrs
    assert redirected_to(conn) == website_path(conn, :show, website)
    assert Repo.get_by(Website, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    website = Repo.insert! %Website{}
    conn = put conn, website_path(conn, :update, website), website: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit website"
  end

  test "deletes chosen resource", %{conn: conn} do
    website = Repo.insert! %Website{}
    conn = delete conn, website_path(conn, :delete, website)
    assert redirected_to(conn) == website_path(conn, :index)
    refute Repo.get(Website, website.id)
  end
end
