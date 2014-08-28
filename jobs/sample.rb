current_valuation = 0
current_karma = 0
i = 1
x = [200, 210, 220, 230, 240, 250, 260, 280, 300, 320]
y = [200, 210, 220, 230, 240, 250, 260, 280, 300, 320]

SCHEDULER.every '2s' do
  last_valuation = current_valuation
  last_karma     = current_karma
  current_valuation = rand(100)
  current_karma     = rand(200000)
  x_size = x.sample
  y_size = y.sample

  
  image = "http://placegoat.com/#{x_size}/#{y_size}" if i % 2 == 0
  image = "http://placekitten.com/#{x_size}/#{y_size}" unless i % 2 == 0
  i += 1

  send_event('valuation', { current: current_valuation, last: last_valuation })
  send_event('karma', { current: current_karma, last: last_karma })
  send_event('synergy',   { value: rand(100) })
  send_event('cat', { image: image })
end