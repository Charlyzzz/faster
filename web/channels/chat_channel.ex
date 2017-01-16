defmodule Faster.ChatChannel do
  use Faster.Web, :channel

  def join("lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("new_message", payload, socket) do
    broadcast! socket, "new_message", payload
    {:noreply, socket}
  end 

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
