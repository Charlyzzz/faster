defmodule Faster.PageController do
  use Faster.Web, :controller
  alias Faster.Session

  def index(conn, _params) do   
    if Session.logged_in?(conn) do
      render conn, "logged.html", user: Session.current_user(conn)
    else
      render conn, "not_logged.html"
    end
  end
end
