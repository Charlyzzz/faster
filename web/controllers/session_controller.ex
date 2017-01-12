defmodule Faster.SessionController do
  use Faster.Web, :controller
  alias Faster.User

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"login" => login_params}) do
    login_data = 
        Map.split(login_params, ["username", "password"]) 
        |> elem(0)

    case User.authenticate(login_data) do
         nil -> 
            conn
            |> put_flash(:info, "Wrong email or password")
            |> redirect(to: session_path(conn, :create)) 

        user -> 
            conn
            |> put_session(:current_user, user.id)
            |> put_flash(:info, "Logged in!")
            |> redirect(to: "/")          
    end
  end  
end
