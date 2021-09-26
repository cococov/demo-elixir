defmodule DemoElixirWeb.PageController do
  use DemoElixirWeb, :controller

  alias DemoElixir.Chat

  def index(conn, _params) do
    messages = Chat.list_messages()
    render conn, "index.html", messages: messages
  end
end
