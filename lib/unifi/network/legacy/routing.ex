defmodule UniFi.Network.Legacy.Routing do
  @moduledoc """
  Manage static routes via the legacy API.
  """

  @doc """
  List all static routes.
  """
  @spec list(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req) do
    Req.request(req, method: :get, url: "/rest/routing")
  end

  @doc """
  Get a specific route by `_id`.
  """
  @spec get(Req.Request.t(), String.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, id) do
    Req.request(req, method: :get, url: "/rest/routing/{id}", path_params_style: :curly, path_params: [id: id])
  end

  @doc """
  Create a static route.
  """
  @spec create(Req.Request.t(), map()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create(req, body) do
    Req.request(req, method: :post, url: "/rest/routing", json: body)
  end

  @doc """
  Update a static route.
  """
  @spec update(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update(req, id, body) do
    Req.request(req, method: :put, url: "/rest/routing/{id}", path_params_style: :curly, path_params: [id: id], json: body)
  end

  @doc """
  Delete a static route.
  """
  @spec delete(Req.Request.t(), String.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete(req, id) do
    Req.request(req, method: :delete, url: "/rest/routing/{id}", path_params_style: :curly, path_params: [id: id])
  end

  @doc """
  Get routing statistics.
  """
  @spec stats(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def stats(req) do
    Req.request(req, method: :get, url: "/stat/routing")
  end
end
