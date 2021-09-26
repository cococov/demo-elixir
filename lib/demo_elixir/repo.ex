defmodule DemoElixir.Repo do
  use Ecto.Repo,
    otp_app: :demo_elixir,
    adapter: Ecto.Adapters.Postgres
end
