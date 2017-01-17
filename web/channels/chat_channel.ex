defmodule Faster.ChatChannel do
  use Faster.Web, :channel
  alias Faster.Message

  def join("lobby", payload, socket) do
     send self(), {:after_join, payload}
     {:ok, socket}
  end

   def handle_info({:after_join, payload}, socket) do
    broadcast! socket, "join", payload    
    {:noreply, socket}
  end
  

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("new_message", payload, socket) do
    Message.create(payload)
    broadcast! socket, "new_message", payload
    {:noreply, socket}
  end
end
