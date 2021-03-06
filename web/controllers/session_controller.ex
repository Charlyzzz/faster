defmodule Faster.SessionController do
  use Faster.Web, :controller
  alias Faster.User

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"login" => login_params}) do
    login_params
    |> User.authenticate
    |> login(conn)
  end

  def delete(conn, _params) do
    conn
      |> delete_session(:current_user)
      |> put_flash(:info, "Logged out")
      |> redirect(to: "/")
  end

  defp login(nil, conn) do
    conn
    |> put_flash(:info, "Wrong username or password")
    |> redirect(to: session_path(conn, :create)) 
  end

  defp login(user, conn) do
    conn
      |> put_session(:current_user, user.id)
      |> put_flash(:info, "Logged in!")
      |> redirect(to: "/")
  end  
end
