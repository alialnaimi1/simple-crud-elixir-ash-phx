defmodule App.Shop do
  use Ash.Api
  resources do
    resource App.Shop.Product
  end
end
