defmodule FarmManagementSystem.Repo do
  use Ecto.Repo,
    otp_app: :farm_management_system,
    adapter: Ecto.Adapters.Postgres
end
