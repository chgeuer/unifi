defmodule UniFi.Network.Legacy.Users do
  @moduledoc """
  Manage known users/clients (historical) via the legacy API.

  Unlike the integration API which only shows currently connected clients,
  this shows all clients the controller has ever seen (71+ entries).
  """

  @doc """
  List all known users (historical client database).
  """
  @spec list(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req) do
    Req.request(req, method: :get, url: "/rest/user")
  end

  @doc """
  Get a specific user by `_id`.
  """
  @spec get(Req.Request.t(), String.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, id) do
    Req.request(req, method: :get, url: "/rest/user/{id}", path_params_style: :curly, path_params: [id: id])
  end

  @doc """
  Update a user (e.g., set name, block/unblock, assign to group).
  """
  @spec update(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update(req, id, body) do
    Req.request(req, method: :put, url: "/rest/user/{id}", path_params_style: :curly, path_params: [id: id], json: body)
  end

  @doc """
  List user groups.
  """
  @spec list_groups(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_groups(req) do
    Req.request(req, method: :get, url: "/rest/usergroup")
  end
end
