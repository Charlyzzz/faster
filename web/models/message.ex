defmodule Faster.Message do
  use Faster.Web, :model
  alias Faster.{Message, Repo}

  schema "messages" do
    field :content, :string
    field :user, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content, :user])
    |> validate_required([:content, :user])
    |> validate_length(:content, min: 1)
  end

  def create(payload_params) do
    changeset(%Message{}, payload_params)
    |> Repo.insert!
  end

  def all do
    Message 
    |> order_by(:inserted_at) 
    |> Repo.all
  end  
end
