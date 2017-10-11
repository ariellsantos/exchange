defmodule Exchange.Usuario do
  use Ecto.Schema
  import Ecto.Changeset
  alias Exchange.Usuario


  schema "usuarios" do
    field :nombre, :string
    field :email, :string
    field :crypto_password, :string
    field :password, :string, virtual: true

    timestamps()
  end

  def changeset(%Usuario{} = usuario, attrs) do
    usuario
    |> cast(attrs, [:nombre, :email, :password])
    |> validate_required([:email, :password])
    |> validate_length(:password, min: 5)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
