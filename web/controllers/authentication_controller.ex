defmodule Faster.AuthenticationController do
  use Faster.Web, :controller
  alias Faster.{User, Authentication, Repo}

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do    
    changeset = User.changeset(%User{}, user_params)
    case Authentication.create(changeset, Repo) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Your account was created")
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:warning, "Unable to create account")
        |> render("new.html", changeset: changeset)    
    end
  end
end
