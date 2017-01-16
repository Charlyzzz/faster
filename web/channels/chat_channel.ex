defmodule Faster.ChatChannel do
  use Faster.Web, :channel
  alias Faster.Message

  def join("lobby", _payload, socket), do: {:ok, socket}

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("new_message", payload, socket) do
    Message.create(payload)
    broadcast! socket, "new_message", payload
    {:noreply, socket}
  end
end
