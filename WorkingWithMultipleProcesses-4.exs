defmodule Link do
  import :timer, only: [ sleep: 1 ]

  def process do
    raise "An error occured in the process"
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

# The full error information was passed to the parent instead of just the
# message
