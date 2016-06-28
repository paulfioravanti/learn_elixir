defmodule SpeakerTest do
  use ExUnit.Case
  # import ExUnit.CaptureIO

  doctest Speaker

  # NOTE: every `setup` has access to a `context` which can be populated
  # by `@tag` values, and the `context` of each test contains the return
  # value of the `setup` block
  setup context do
    pid = Kernel.spawn(Speaker, :speak, [])
    response = send(pid, context[:message])
    { :ok, [response: response] }
  end

  @tag message: { :say, "Hello" }
  test ".speak with context map", context do
    assert context[:response] == { :say, "Hello" }
  end

  @tag message: { :say, "Hello" }
  test ".speak with map matching", %{ response: response } do
    assert response == { :say, "Hello" }
  end

  # How to test captured IO from a spawned process:
  # http://stackoverflow.com/q/38064313/567863
  test ".speak with capture io" do
    test_process = self
    pid = spawn(fn ->
      Process.group_leader(self, test_process)
      Speaker.speak
    end)

    send(pid, { :say, "Hello" })
    assert_receive { :io_request, _, _, { :put_chars, :unicode, "Hello\n" } }

    # Just to cleanup pid which dies upon not receiving a correct response
    # to the :io_request after a timeout
    Process.exit(pid, :kill)
  end
end
