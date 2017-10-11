defmodule Exchange.Repo.Migrations.AddColumnPrincipalToMonedaTable do
  use Ecto.Migration

  def change do
    alter table(:monedas) do
      add :principal, :boolean
    end
  end
end
