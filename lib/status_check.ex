defmodule StatusCheck do
  alias StatusCheck.StatusChecker

  @moduledoc """
  retrieves status code and response time from a list of urls
  """

  def main(urls \\ []) do
    urls
    |> Enum.map(&Task.async(fn -> StatusChecker.get(&1) end))
    |> Enum.map(&Task.await/1)
    |> Enum.each(&IO.puts/1)
  end
end
