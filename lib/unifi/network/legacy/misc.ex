defmodule UniFi.Network.Legacy.Misc do
  @moduledoc """
  Miscellaneous legacy API endpoints: port profiles, dynamic DNS,
  RADIUS profiles, hotspot operators, and current user info.
  """

  # --- Port Profiles ---

  @doc """
  List port profile configurations.
  """
  @spec list_port_profiles(Req.Request.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_port_profiles(req) do
    Req.request(req, method: :get, url: "/rest/portconf")
  end

  # --- Dynamic DNS ---

  @doc """
  List dynamic DNS configurations.
  """
  @spec list_dynamic_dns(Req.Request.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_dynamic_dns(req) do
    Req.request(req, method: :get, url: "/rest/dynamicdns")
  end

  @doc """
  Create a dynamic DNS configuration.
  """
  @spec create_dynamic_dns(Req.Request.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create_dynamic_dns(req, body) do
    Req.request(req, method: :post, url: "/rest/dynamicdns", json: body)
  end

  @doc """
  Update a dynamic DNS configuration.
  """
  @spec update_dynamic_dns(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update_dynamic_dns(req, id, body) do
    Req.request(req, method: :put, url: "/rest/dynamicdns/{id}", path_params_style: :curly, path_params: [id: id], json: body)
  end

  @doc """
  Delete a dynamic DNS configuration.
  """
  @spec delete_dynamic_dns(Req.Request.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete_dynamic_dns(req, id) do
    Req.request(req, method: :delete, url: "/rest/dynamicdns/{id}", path_params_style: :curly, path_params: [id: id])
  end

  # --- RADIUS Profiles ---

  @doc """
  List RADIUS profiles.
  """
  @spec list_radius_profiles(Req.Request.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_radius_profiles(req) do
    Req.request(req, method: :get, url: "/rest/radiusprofile")
  end

  # --- Hotspot Operators ---

  @doc """
  List hotspot operators.
  """
  @spec list_hotspot_operators(Req.Request.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_hotspot_operators(req) do
    Req.request(req, method: :get, url: "/rest/hotspotop")
  end

  @doc """
  List Hotspot 2.0 configurations.
  """
  @spec list_hotspot2_conf(Req.Request.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_hotspot2_conf(req) do
    Req.request(req, method: :get, url: "/rest/hotspot2conf")
  end

  # --- Tags ---

  @doc """
  List tags.
  """
  @spec list_tags(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_tags(req) do
    Req.request(req, method: :get, url: "/rest/tag")
  end

  # --- RADIUS Accounts ---

  @doc """
  List RADIUS accounts.
  """
  @spec list_accounts(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_accounts(req) do
    Req.request(req, method: :get, url: "/rest/account")
  end

  # --- Channel Plan ---

  @doc """
  List channel plan configurations.
  """
  @spec list_channel_plans(Req.Request.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_channel_plans(req) do
    Req.request(req, method: :get, url: "/rest/channelplan")
  end

  # --- Virtual Devices ---

  @doc """
  List virtual devices.
  """
  @spec list_virtual_devices(Req.Request.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_virtual_devices(req) do
    Req.request(req, method: :get, url: "/rest/virtualdevice")
  end

  # --- Self ---

  @doc """
  Get current API user information.
  """
  @spec self(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def self(req) do
    Req.request(req, method: :get, url: "/self")
  end
end
