defmodule UniFi.Network.Legacy.Settings do
  @moduledoc """
  Read and update controller settings via the legacy API.

  Settings are keyed objects covering SSH, DPI, guest access, NTP,
  country, management, and many more. Each has a unique `_id` and a `key`.

  ## Examples

      req = UniFi.Network.Legacy.client(base_url: "https://192.168.1.1", api_key: "KEY", verify: false)

      # List all settings
      {:ok, %{body: %{"data" => settings}}} = UniFi.Network.Legacy.Settings.list(req)

      # Get SSH/management config
      {:ok, %{body: %{"data" => [mgmt]}}} = UniFi.Network.Legacy.Settings.list(req)
      mgmt = Enum.find(settings, & &1["key"] == "mgmt")

      # Update a setting
      UniFi.Network.Legacy.Settings.update(req, mgmt["_id"], %{mgmt | "x_ssh_enabled" => true})
  """

  @doc """
  List all settings (35 setting objects covering SSH, DPI, guest access, etc.).
  """
  @spec list(Req.Request.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list(req) do
    Req.request(req, method: :get, url: "/rest/setting")
  end

  @doc """
  Get a specific setting by its `_id`.
  """
  @spec get(Req.Request.t(), String.t()) :: {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get(req, id) do
    Req.request(req, method: :get, url: "/rest/setting/{id}", path_params_style: :curly, path_params: [id: id])
  end

  @doc """
  Update a setting by its `_id`.

  Pass the full setting object with modifications.
  """
  @spec update(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def update(req, id, body) do
    Req.request(req, method: :put, url: "/rest/setting/{id}", path_params_style: :curly, path_params: [id: id], json: body)
  end

  @doc """
  Find a setting by its key name (e.g., "mgmt", "dpi", "country", "usg").

  Returns `nil` if not found.
  """
  @spec find_by_key(Req.Request.t(), String.t()) :: map() | nil
  def find_by_key(req, key) do
    {:ok, %{status: 200, body: %{"data" => settings}}} = list(req)
    Enum.find(settings, &(&1["key"] == key))
  end
end
