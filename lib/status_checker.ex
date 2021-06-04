defmodule StatusCheck.StatusChecker do
  alias StatusCheck.HTTPRequest

  def get(url) do
    case :timer.tc(fn -> HTTPRequest.get_info_url(url) end) do
      {microseconds, {:ok, status}} -> display(microseconds, url, status)
      {microseconds, {:error, :nxdomain}} -> display(microseconds, url, "nxdomain")
      {_, {:error, status}} -> status
    end
  end

  defp display(time, url, code) do
    response_time = System.convert_time_unit(time, :microsecond, :millisecond)

    "GET\t #{url} -> #{response_time}ms\t #{code}"
  end
end

