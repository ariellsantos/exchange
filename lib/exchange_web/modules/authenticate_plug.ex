defmodule ExchangeWeb.AuthenticatePlug do

  import ExchangeWeb.Router.Helpers
  import Phoenix.Controller

  def init(default), do: default

  def call(conn, default) do
    current_user = Plug.Conn.get_session(conn, :current_user)
    if current_user do
      Plug.Conn.assign(conn, :current_user, current_user)
    else
      conn
      |> put_flash(:error, "You need to be signed in to view this page")
      |> redirect(to: session_path(conn,:new))
    end
  end
end