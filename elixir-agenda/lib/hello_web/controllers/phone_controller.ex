defmodule HelloWeb.PhoneController do
  use HelloWeb, :controller

  alias Hello.Agenda
  alias Hello.Agenda.Phone

  def index(conn, _params) do
    phones = Agenda.list_phones()
    render(conn, "index.html", phones: phones)
  end

  def new(conn, _params) do
    changeset = Agenda.change_phone(%Phone{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"phone" => phone_params}) do
    case Agenda.create_phone(phone_params) do
      {:ok, phone} ->
        conn
        |> put_flash(:info, "Phone created successfully.")
        |> redirect(to: phone_path(conn, :show, phone))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    phone = Agenda.get_phone!(id)
    render(conn, "show.html", phone: phone)
  end

  def edit(conn, %{"id" => id}) do
    phone = Agenda.get_phone!(id)
    changeset = Agenda.change_phone(phone)
    render(conn, "edit.html", phone: phone, changeset: changeset)
  end

  def update(conn, %{"id" => id, "phone" => phone_params}) do
    phone = Agenda.get_phone!(id)

    case Agenda.update_phone(phone, phone_params) do
      {:ok, phone} ->
        conn
        |> put_flash(:info, "Phone updated successfully.")
        |> redirect(to: phone_path(conn, :show, phone))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", phone: phone, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    phone = Agenda.get_phone!(id)
    {:ok, _phone} = Agenda.delete_phone(phone)

    conn
    |> put_flash(:info, "Phone deleted successfully.")
    |> redirect(to: phone_path(conn, :index))
  end
end
