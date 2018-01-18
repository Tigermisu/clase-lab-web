defmodule Hello.Agenda.Phone do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Agenda.Phone


  schema "phones" do
    field :address, :string
    field :email, :string
    field :last_name, :string
    field :name, :string
    field :phone, :string
    field :phone_type, :string

    timestamps()
  end

  @doc false
  def changeset(%Phone{} = phone, attrs) do
    phone
    |> cast(attrs, [:name, :last_name, :address, :email, :phone, :phone_type])
    |> validate_required([:name, :last_name, :address, :email, :phone, :phone_type])
  end
end
