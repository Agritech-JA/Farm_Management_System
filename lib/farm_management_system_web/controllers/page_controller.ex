defmodule FarmManagementSystemWeb.PageController do
  use FarmManagementSystemWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
