defmodule URLTest do
  use ExUnit.Case
  alias StatusCheck.URL
  doctest URL

  describe "validates an url" do
    test "returns a success message" do
      assert URL.validate("google.com") == {:ok, "http://google.com"}
    end

    test "returns scheme error message" do
      assert URL.validate("htpp://not-a-web-url") == {:error, "invalid scheme"}
    end
  end
end

