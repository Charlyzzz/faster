defmodule Faster.PageController do
  use Faster.Web, :controller
  alias Faster.Session

  def index(conn, _params) do
    render conn, "index.html", user: Session.current_user(conn)
  end
end
