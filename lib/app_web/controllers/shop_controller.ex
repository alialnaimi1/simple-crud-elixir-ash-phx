defmodule AppWeb.ShopController do
  use AppWeb, :controller

  def mylist(conn, _params) do
    render(conn, :shop, layout: false)
  end

end
