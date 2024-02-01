defmodule App.Repo do
  # use Ecto.Repo,
  #   otp_app: :app,
  #   adapter: Ecto.Adapters.Postgres
  use AshPostgres.Repo, otp_app: :app
  def installed_extensions do
    ["uuid-ossp", "citext"]
  end
end
