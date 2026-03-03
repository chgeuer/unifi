defmodule UniFi.Network.Legacy.PortForwards do
  @moduledoc """
  Manage port forwarding rules via the legacy API.
  """

  @doc """
  List all port forwarding rules.
  """
  @spec list(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req) do
    Req.request(req, method: :get, url: "/rest/portforward")
  end

  @doc """
  Get a specific port forwarding rule by `_id`.
  """
  @spec get(Req.Request.t(), String.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, id) do
    Req.request(req, method: :get, url: "/rest/portforward/{id}", path_params_style: :curly, path_params: [id: id])
  end

  @doc """
  Create a port forwarding rule.
  """
  @spec create(Req.Request.t(), map()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create(req, body) do
    Req.request(req, method: :post, url: "/rest/portforward", json: body)
  end

  @doc """
  Update a port forwarding rule.
  """
  @spec update(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update(req, id, body) do
    Req.request(req, method: :put, url: "/rest/portforward/{id}", path_params_style: :curly, path_params: [id: id], json: body)
  end

  @doc """
  Delete a port forwarding rule.
  """
  @spec delete(Req.Request.t(), String.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete(req, id) do
    Req.request(req, method: :delete, url: "/rest/portforward/{id}", path_params_style: :curly, path_params: [id: id])
  end
end
