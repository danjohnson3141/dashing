current_bathroom_line = 12
bathroom_line = 12

SCHEDULER.every '2s' do
  last_bathroom_line = current_bathroom_line
  current_bathroom_line = last_bathroom_line + [*-2..1].sample
  current_bathroom_line = 0 if current_bathroom_line < 0

  send_event('bathroom', { current: current_bathroom_line, last: last_bathroom_line })
  # send_event('bathroom', { current: 2, last: 4 })
end