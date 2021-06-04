defmodule StatusCheck.HTTPRequest do
  alias StatusCheck.URL

  def get_info_url(url) do
    with {:ok, uri} <- URL.validate(url) do
      get_info(uri)
    else
      _error -> {:error, "IGNORED\t #{url}"}
    end
  end

  defp get_info(uri) do
    case HTTPoison.get(uri) do
      {:ok, %HTTPoison.Response{status_code: status_code}} -> {:ok, status_code}
      {:error, %HTTPoison.Error{reason: reason}} -> {:error, reason}
    end
  end
end

