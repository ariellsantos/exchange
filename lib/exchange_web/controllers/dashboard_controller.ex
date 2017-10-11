defmodule ExchangeWeb.DashboardController do
  use ExchangeWeb, :controller
  plug ExchangeWeb.AuthenticatePlug when action in [:index]

  def index(conn, _params) do
    render conn, "index.html"
  end  
end
