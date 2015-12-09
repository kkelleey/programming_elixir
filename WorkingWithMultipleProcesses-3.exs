defmodule Link do
  import :timer, only: [ sleep: 1 ]

  def process do
    exit(:message_sent_by_process)
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_monitor(Link, :process, [])
    sleep 500
    receive do
      msg -> IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    end
  end
end

Link.run

# it doesn't matter that we weren't waiting for the notification from the child
# when it exited
