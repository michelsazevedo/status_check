defmodule StatusCheck.HTTPRequestTest do
  use ExUnit.Case
  alias StatusCheck.HTTPRequest

  import Mock

  @ignored "htpp://hello-world"
  @nxdomain "inactive-domain.blah"
  @ok "google.com"

  describe "getting uri info" do
    test 'returns ignored request' do
      assert HTTPRequest.get_info_url(@ignored) == {:error, "IGNORED\t #{@ignored}"}
    end

    test 'returns success request' do
      with_mock HTTPoison, [get: fn(_) -> 
        {:ok, %HTTPoison.Response{status_code: 301}} end] do
          assert HTTPRequest.get_info_url(@ok) == {:ok, 301}
        end
    end

    test 'returns nxdomain error' do
      with_mock HTTPoison, [get: fn(_) -> 
        {:error, %HTTPoison.Error{reason: :nxdomain}} end] do
          assert HTTPRequest.get_info_url(@nxdomain) == {:error, :nxdomain}
        end
    end
  end
end

