defmodule UniFi.Network.Clients do
  @moduledoc """
  Manage connected clients on a site.
  """

  @doc """
  List connected clients on a site.
  """
  @spec list(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/clients",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  Get details of a specific connected client.
  """
  @spec get(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, site_id, client_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/clients/{clientId}",
      path_params_style: :curly, path_params: [siteId: site_id, clientId: client_id]
    )
  end

  @doc """
  Execute an action on a connected client (e.g., block, reconnect).
  """
  @spec execute_action(Req.Request.t(), String.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def execute_action(req, site_id, client_id, body) do
    Req.request(req,
      method: :post,
      url: "/v1/sites/{siteId}/clients/{clientId}/actions",
      path_params_style: :curly, path_params: [siteId: site_id, clientId: client_id],
      json: body
    )
  end
end
