defmodule HelloWeb.PhoneControllerTest do
  use HelloWeb.ConnCase

  alias Hello.Agenda

  @create_attrs %{address: "some address", email: "some email", last_name: "some last_name", name: "some name", phone: "some phone", phone_type: "some phone_type"}
  @update_attrs %{address: "some updated address", email: "some updated email", last_name: "some updated last_name", name: "some updated name", phone: "some updated phone", phone_type: "some updated phone_type"}
  @invalid_attrs %{address: nil, email: nil, last_name: nil, name: nil, phone: nil, phone_type: nil}

  def fixture(:phone) do
    {:ok, phone} = Agenda.create_phone(@create_attrs)
    phone
  end

  describe "index" do
    test "lists all phones", %{conn: conn} do
      conn = get conn, phone_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Phones"
    end
  end

  describe "new phone" do
    test "renders form", %{conn: conn} do
      conn = get conn, phone_path(conn, :new)
      assert html_response(conn, 200) =~ "New Phone"
    end
  end

  describe "create phone" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, phone_path(conn, :create), phone: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == phone_path(conn, :show, id)

      conn = get conn, phone_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Phone"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, phone_path(conn, :create), phone: @invalid_attrs
      assert html_response(conn, 200) =~ "New Phone"
    end
  end

  describe "edit phone" do
    setup [:create_phone]

    test "renders form for editing chosen phone", %{conn: conn, phone: phone} do
      conn = get conn, phone_path(conn, :edit, phone)
      assert html_response(conn, 200) =~ "Edit Phone"
    end
  end

  describe "update phone" do
    setup [:create_phone]

    test "redirects when data is valid", %{conn: conn, phone: phone} do
      conn = put conn, phone_path(conn, :update, phone), phone: @update_attrs
      assert redirected_to(conn) == phone_path(conn, :show, phone)

      conn = get conn, phone_path(conn, :show, phone)
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, phone: phone} do
      conn = put conn, phone_path(conn, :update, phone), phone: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Phone"
    end
  end

  describe "delete phone" do
    setup [:create_phone]

    test "deletes chosen phone", %{conn: conn, phone: phone} do
      conn = delete conn, phone_path(conn, :delete, phone)
      assert redirected_to(conn) == phone_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, phone_path(conn, :show, phone)
      end
    end
  end

  defp create_phone(_) do
    phone = fixture(:phone)
    {:ok, phone: phone}
  end
end
