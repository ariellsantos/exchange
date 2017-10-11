defmodule  ExchangeWeb.RegistrationController do
  use ExchangeWeb, :controller
  alias Exchange.Usuario

  def new(conn, params) do
      changeset = Usuario.changeset(%Usuario{}, params)
      render conn, changeset: changeset
  end

  def create(conn, %{"usuario"=> usuario_params}) do
    changeset = Usuario.changeset(%Usuario{}, usuario_params)


    case ExchangeWeb.Registration.create(changeset, Exchange.Repo) do
      {:ok, changeset} ->
        conn
        |> put_session(:current_user, changeset.id)
        |> put_flash(:info, "Your account was created")
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Unable to create account")
        |> render("new.html", changeset: changeset)
    end
    
  end

end