defmodule AppWeb.ShopHTML do
  use AppWeb, :html

  embed_templates "shop_html/*"

  def mount(_conn, _params) do
    {:ok, []}
  end
end
