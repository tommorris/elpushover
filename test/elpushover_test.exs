defmodule ElpushoverTest do
  use ExUnit.Case
  import Mock
  #doctest Elpushover

  test "send notification" do
    #actual = Elpushover.notify("hello world")
    with_mock Elpushover.Api, [post: fn(url, params) -> PushoverNotificationMock.post(url, params) end, start: fn() -> PushoverNotificationMock.start() end] do
      assert {:ok, body} = Elpushover.notify("hello world")
    end
  end
end
