defmodule Hello.AgendaTest do
  use Hello.DataCase

  alias Hello.Agenda

  describe "phones" do
    alias Hello.Agenda.Phone

    @valid_attrs %{address: "some address", email: "some email", last_name: "some last_name", name: "some name", phone: "some phone", phone_type: "some phone_type"}
    @update_attrs %{address: "some updated address", email: "some updated email", last_name: "some updated last_name", name: "some updated name", phone: "some updated phone", phone_type: "some updated phone_type"}
    @invalid_attrs %{address: nil, email: nil, last_name: nil, name: nil, phone: nil, phone_type: nil}

    def phone_fixture(attrs \\ %{}) do
      {:ok, phone} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Agenda.create_phone()

      phone
    end

    test "list_phones/0 returns all phones" do
      phone = phone_fixture()
      assert Agenda.list_phones() == [phone]
    end

    test "get_phone!/1 returns the phone with given id" do
      phone = phone_fixture()
      assert Agenda.get_phone!(phone.id) == phone
    end

    test "create_phone/1 with valid data creates a phone" do
      assert {:ok, %Phone{} = phone} = Agenda.create_phone(@valid_attrs)
      assert phone.address == "some address"
      assert phone.email == "some email"
      assert phone.last_name == "some last_name"
      assert phone.name == "some name"
      assert phone.phone == "some phone"
      assert phone.phone_type == "some phone_type"
    end

    test "create_phone/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Agenda.create_phone(@invalid_attrs)
    end

    test "update_phone/2 with valid data updates the phone" do
      phone = phone_fixture()
      assert {:ok, phone} = Agenda.update_phone(phone, @update_attrs)
      assert %Phone{} = phone
      assert phone.address == "some updated address"
      assert phone.email == "some updated email"
      assert phone.last_name == "some updated last_name"
      assert phone.name == "some updated name"
      assert phone.phone == "some updated phone"
      assert phone.phone_type == "some updated phone_type"
    end

    test "update_phone/2 with invalid data returns error changeset" do
      phone = phone_fixture()
      assert {:error, %Ecto.Changeset{}} = Agenda.update_phone(phone, @invalid_attrs)
      assert phone == Agenda.get_phone!(phone.id)
    end

    test "delete_phone/1 deletes the phone" do
      phone = phone_fixture()
      assert {:ok, %Phone{}} = Agenda.delete_phone(phone)
      assert_raise Ecto.NoResultsError, fn -> Agenda.get_phone!(phone.id) end
    end

    test "change_phone/1 returns a phone changeset" do
      phone = phone_fixture()
      assert %Ecto.Changeset{} = Agenda.change_phone(phone)
    end
  end
end
