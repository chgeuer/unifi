defmodule UniFi.Network.Hotspot do
  @moduledoc """
  Manage hotspot vouchers on a site.
  """

  @doc """
  List all vouchers on a site.
  """
  @spec list_vouchers(Req.Request.t(), String.t(), keyword()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def list_vouchers(req, site_id, params \\ []) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/hotspot/vouchers",
      path_params_style: :curly, path_params: [siteId: site_id],
      params: params
    )
  end

  @doc """
  Get details of a specific voucher.
  """
  @spec get_voucher(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def get_voucher(req, site_id, voucher_id) do
    Req.request(req,
      method: :get,
      url: "/v1/sites/{siteId}/hotspot/vouchers/{voucherId}",
      path_params_style: :curly, path_params: [siteId: site_id, voucherId: voucher_id]
    )
  end

  @doc """
  Generate new vouchers.
  """
  @spec create_vouchers(Req.Request.t(), String.t(), map()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def create_vouchers(req, site_id, body) do
    Req.request(req,
      method: :post,
      url: "/v1/sites/{siteId}/hotspot/vouchers",
      path_params_style: :curly, path_params: [siteId: site_id],
      json: body
    )
  end

  @doc """
  Delete all vouchers on a site.
  """
  @spec delete_vouchers(Req.Request.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete_vouchers(req, site_id) do
    Req.request(req,
      method: :delete,
      url: "/v1/sites/{siteId}/hotspot/vouchers",
      path_params_style: :curly, path_params: [siteId: site_id]
    )
  end

  @doc """
  Delete a specific voucher.
  """
  @spec delete_voucher(Req.Request.t(), String.t(), String.t()) ::
          {:ok, Req.Response.t()} | {:error, Exception.t()}
  def delete_voucher(req, site_id, voucher_id) do
    Req.request(req,
      method: :delete,
      url: "/v1/sites/{siteId}/hotspot/vouchers/{voucherId}",
      path_params_style: :curly, path_params: [siteId: site_id, voucherId: voucher_id]
    )
  end
end
