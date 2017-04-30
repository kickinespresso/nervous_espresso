defmodule Ui.WebsiteController do
  use Ui.Web, :controller

  alias Ui.Website

  def index(conn, _params) do

    website = Scrape.website "http://www.latimes.com"
    IO.puts "here"
    render(conn, "index.html", website: website)
  end


  def new(conn, _params) do
    changeset = Website.changeset(%Website{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"website" => website_params}) do
    changeset = Website.changeset(%Website{}, website_params)

    case Repo.insert(changeset) do
      {:ok, _website} ->
        conn
        |> put_flash(:info, "Website created successfully.")
        |> redirect(to: website_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    website = Repo.get!(Website, id)
    render(conn, "show.html", website: website)
  end

  def edit(conn, %{"id" => id}) do
    website = Repo.get!(Website, id)
    changeset = Website.changeset(website)
    render(conn, "edit.html", website: website, changeset: changeset)
  end

  def update(conn, %{"id" => id, "website" => website_params}) do
    website = Repo.get!(Website, id)
    changeset = Website.changeset(website, website_params)

    case Repo.update(changeset) do
      {:ok, website} ->
        conn
        |> put_flash(:info, "Website updated successfully.")
        |> redirect(to: website_path(conn, :show, website))
      {:error, changeset} ->
        render(conn, "edit.html", website: website, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    website = Repo.get!(Website, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(website)

    conn
    |> put_flash(:info, "Website deleted successfully.")
    |> redirect(to: website_path(conn, :index))
  end
end
