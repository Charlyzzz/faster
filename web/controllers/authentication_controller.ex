defmodule Faster.AuthenticationController do
  use Faster.Web, :controller
  alias Faster.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, _params) do
    #render conn, "index.html"
  end
end
