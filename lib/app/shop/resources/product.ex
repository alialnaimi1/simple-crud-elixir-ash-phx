defmodule App.Shop.Product do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "products"
    repo App.Repo
  end

  attributes do
    uuid_primary_key :id
    attribute :title, :string
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  code_interface do
    define_for App.Shop
    define :create
    define :read
    define :update
    define :by_id, get_by: [:id], action: :read
    define :destroy
  end
end
