defmodule DemoElixirWeb.MainChannel do
  use DemoElixirWeb, :channel

  alias DemoElixir.Chat

  @impl true
  def join("main:lobby", _payload, socket) do
    {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (main:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    Chat.create_message(payload)
    broadcast socket, "shout", payload
    {:noreply, socket}
  end
end
