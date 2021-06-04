defmodule StatusCheckTest do
  use ExUnit.Case
  doctest StatusCheck

  test "performs status check" do
    assert StatusCheck.main()
  end
end
