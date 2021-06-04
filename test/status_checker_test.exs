defmodule StatusCheck.StatusCheckerTest do
  use ExUnit.Case
  alias StatusCheck.StatusChecker
  alias StatusCheck.HTTPRequest

  import Mock

  @ignored "htpp://hello-world"
  @nxdomain "inactive-domain.blah"
  @ok "google.com"

  describe "getting http response" do
    test "returns error message" do
      assert StatusChecker.get(@ignored) == "IGNORED\t #{@ignored}"
    end

    test "returns nxdomain error message" do
      with_mock HTTPRequest, [get_info_url: fn(_) -> {:error, :nxdomain} end] do
        assert StatusChecker.get(@nxdomain) == "GET\t #{@nxdomain} -> 0ms\t nxdomain"
      end
    end

    test "return success message" do
      with_mock HTTPRequest, [get_info_url: fn(_) -> {:ok, 301} end] do
        assert StatusChecker.get(@ok) == "GET\t #{@ok} -> 0ms\t 301"
      end
    end
  end
end

