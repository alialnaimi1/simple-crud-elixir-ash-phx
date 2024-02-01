defmodule AppWeb.ShopLive do
  use AppWeb, :live_view
  import Phoenix.HTML.Form
  alias AppWeb.ShopHTML

  def mount(_params, _session, socket) do
    products = App.Shop.Product.read!()
    socket = assign(socket,
    products: products,
    form: AshPhoenix.Form.for_create(App.Shop.Product, :create) |> to_form()
    )
    {:ok, socket}
  end

  def handle_event("add_product", %{"form" => %{"title" => title}}, socket) do
    App.Shop.Product.create!(%{title: title})
    products = App.Shop.Product.read!()
    {:noreply, assign(socket, :products, products)}
  end

  def handle_event("delete_product", %{"product-id" => id}, socket) do
    id |> App.Shop.Product.by_id!() |> App.Shop.Product.destroy!()
    products = App.Shop.Product.read!()
    {:noreply, assign(socket, :products, products)}
  end


  def handle_event("edit_product", %{"product-id" => id, "value" => n}, socket) do
    # update the form
    product = id |> App.Shop.Product.by_id!()
    products = App.Shop.Product.read!()
    socket = assign(socket,
      products: products,
      form: AshPhoenix.Form.for_update(product, :update, id: id, title: product.title) |> to_form()
    )
    {:noreply, socket}
  end



  def handle_info(:after_connect, socket) do
    {:noreply, assign(socket, :products, App.Shop.Product.read!())}
  end

  def render(assigns) do
    ShopHTML.mylist(assigns)
  end
end
