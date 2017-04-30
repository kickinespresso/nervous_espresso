defmodule Ui.Website do
  use Ui.Web, :model


  defstruct name: nil, url: nil, content: nil

  # schema "websites" do
  #   field :url, :string
  #   field :name, :string
  #
  #   timestamps()
  # end
  #
  # @doc """
  # Builds a changeset based on the `struct` and `params`.
  # """
  # def changeset(struct, params \\ %{}) do
  #   struct
  #   |> cast(params, [:url, :name, :content])
  #   #|> validate_required([:url, :name])
  # end
end
