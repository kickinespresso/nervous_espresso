defmodule Ui.WebsiteTest do
  use Ui.ModelCase

  alias Ui.Website

  @valid_attrs %{content: "some content", name: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Website.changeset(%Website{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Website.changeset(%Website{}, @invalid_attrs)
    refute changeset.valid?
  end
end
