defmodule Exchange.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nombre, :string
      add :email, :string
      add :crypto_password, :string

      timestamps()
    end

    create unique_index(:usuarios, [:email])
  end
end
