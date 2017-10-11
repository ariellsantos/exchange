defmodule ExchangeWeb.Session do
  alias Exchange.Usuario

  def login(params, repo) do
    usuario = repo.get_by(Usuario, email: String.downcase(params["email"]))
    case authenticate(usuario, params["password"]) do
      true -> {:ok, usuario}
      _    -> :error
    end
  end

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: Exchange.Repo.get(Usuario, id)
  end

  def logged_in?(conn), do: !!current_user(conn)

  defp authenticate(usuario, password) do
    case usuario do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(password, usuario.crypto_password)
    end
  end
end