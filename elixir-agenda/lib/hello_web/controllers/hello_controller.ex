defmodule HelloWeb.HelloController do
    use HelloWeb, :controller

    def index(conn, _params) do 
        redirect conn, to: "/phones"
    end
end