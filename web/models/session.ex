defmodule Faster.Session do
  use Faster.Web, :model
  alias Faster.{Repo, User}

  def logged_in?(connection), do: !!current_user(connection)

  def current_user(connection) do    
    id = Plug.Conn.get_session(connection, :current_user)
    if id, do: Repo.get(User, id)
  end
end
