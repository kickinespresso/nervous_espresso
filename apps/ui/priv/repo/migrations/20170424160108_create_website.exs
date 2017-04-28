defmodule Ui.Repo.Migrations.CreateWebsite do
  use Ecto.Migration

  def change do
    create table(:websites) do
      add :url, :string
      add :name, :string
      add :content, :text

      timestamps()
    end

  end
end
