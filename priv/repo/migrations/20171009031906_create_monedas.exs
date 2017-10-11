defmodule Exchange.Repo.Migrations.CreateMonedas do
  use Ecto.Migration

  def change do
    create table(:monedas) do
      add :moneda, :string
      add :codigo, :string
      add :tasa_cambio, :decimal
      
      timestamps()
    end

  end
end
