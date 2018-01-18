defmodule Hello.Repo.Migrations.CreatePhones do
  use Ecto.Migration

  def change do
    create table(:phones) do
      add :name, :string
      add :last_name, :string
      add :address, :text
      add :email, :string
      add :phone, :string
      add :phone_type, :string

      timestamps()
    end

  end
end
