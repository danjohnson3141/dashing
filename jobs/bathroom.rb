current_bathroom_line = 10

SCHEDULER.every '2s' do
  last_bathroom_line = current_bathroom_line
  current_bathroom_line = last_bathroom_line + [*-2..1].sample
  current_bathroom_line = 0 if current_bathroom_line < 0

  send_event('bathroom', { current: current_bathroom_line, last: last_bathroom_line })
end