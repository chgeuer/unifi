defmodule UniFi.Network.Legacy.FirewallRules do
  @moduledoc """
  Manage legacy firewall rules and groups via the legacy API.

  These are the traditional (non-zone-based) firewall rules.
  """

  @doc """
  List all firewall rules.
  """
  @spec list(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req) do
    Req.request(req, method: :get, url: "/rest/firewallrule")
  end

  @doc """
  Get a specific firewall rule by `_id`.
  """
  @spec get(Req.Request.t(), String.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, id) do
    Req.request(req, method: :get, url: "/rest/firewallrule/{id}", path_params_style: :curly, path_params: [id: id])
  end

  @doc """
  Create a firewall rule.
  """
  @spec create(Req.Request.t(), map()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create(req, body) do
    Req.request(req, method: :post, url: "/rest/firewallrule", json: body)
  end

  @doc """
  Update a firewall rule.
  """
  @spec update(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update(req, id, body) do
    Req.request(req, method: :put, url: "/rest/firewallrule/{id}", path_params_style: :curly, path_params: [id: id], json: body)
  end

  @doc """
  Delete a firewall rule.
  """
  @spec delete(Req.Request.t(), String.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete(req, id) do
    Req.request(req, method: :delete, url: "/rest/firewallrule/{id}", path_params_style: :curly, path_params: [id: id])
  end

  @doc """
  List all firewall groups (IP groups, port groups).
  """
  @spec list_groups(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_groups(req) do
    Req.request(req, method: :get, url: "/rest/firewallgroup")
  end

  @doc """
  Create a firewall group.
  """
  @spec create_group(Req.Request.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create_group(req, body) do
    Req.request(req, method: :post, url: "/rest/firewallgroup", json: body)
  end

  @doc """
  Update a firewall group.
  """
  @spec update_group(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update_group(req, id, body) do
    Req.request(req, method: :put, url: "/rest/firewallgroup/{id}", path_params_style: :curly, path_params: [id: id], json: body)
  end

  @doc """
  Delete a firewall group.
  """
  @spec delete_group(Req.Request.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete_group(req, id) do
    Req.request(req, method: :delete, url: "/rest/firewallgroup/{id}", path_params_style: :curly, path_params: [id: id])
  end
end
