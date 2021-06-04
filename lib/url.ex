defmodule StatusCheck.URL do

  @schemes ["http", "https"]

  @doc """
  """
  def validate(url) do
    case URI.parse(url) do
      %URI{scheme: nil} -> validate("http://" <> url)
      %URI{scheme: scheme} ->
        cond do
          scheme not in @schemes -> {:error, "invalid scheme"}
          true -> {:ok, url}
        end
    end
  end
end

