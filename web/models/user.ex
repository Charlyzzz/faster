defmodule Faster.User do
  use Faster.Web, :model
  import Ecto.Changeset
  
  schema "users" do
    field :username, :string
    field :password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :password])
    |> validate_required([:username, :password])
    |> unique_constraint(:username)
    |> validate_length(:username, min: 3, max: 15)
  end  

  def hash_password(changeset) do
    password = changeset.params["password"]
    changeset
    |> (& put_change(&1, :password, hashed_password(password))).()
  end

  defp hashed_password(password), do: Cipher.encrypt(password)
end
