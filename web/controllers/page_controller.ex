defmodule Faster.PageController do
  use Faster.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
