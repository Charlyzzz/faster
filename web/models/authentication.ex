defmodule Faster.Authentication do
  import Ecto.Changeset
  

  def create(changeset, repo) do
    changeset
    |> put_change(:password, hashed_password(changeset.params["password"]))
    |> repo.insert()
  end

  defp hashed_password(password) do
    Cipher.encrypt(password)
  end
end
