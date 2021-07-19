$waiting_for_simulation = false

def send_command(cmd)
  $waiting_for_simulation = true
  $command = cmd
  puts "Sending command: #{$command}"
  while not $command.empty?
    sleep 0.02
  end
  puts "Waiting for the simulation"
  wait_simulation_done
  puts "done"
end

def wait_simulation_done
  while $waiting_for_simulation
    sleep 0.02
  end
end
