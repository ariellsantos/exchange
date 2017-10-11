defmodule Exchange.Moneda do
  use Ecto.Schema
  import Ecto.Changeset
  alias Exchange.Moneda


  schema "monedas" do
    field :codigo, :string
    field :moneda, :string
    field :tasa_cambio, :decimal
    field :principal, :boolean

    timestamps()
  end

  @doc false
  def changeset(%Moneda{} = moneda, attrs) do
    moneda
    |> cast(attrs, [:moneda, :codigo, :tasa_cambio])
    |> validate_required([:moneda, :codigo, :tasa_cambio])
  end
end
