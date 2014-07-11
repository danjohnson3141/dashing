current_valuation = 0
current_karma = 0
x = [150, 200, 240, 250, 260, 280, 300, 320, 340, 360, 400, 420, 440]
y = [150, 200, 240, 250, 260, 280, 300, 320, 340, 360, 400, 420, 440]

SCHEDULER.every '2s' do
  last_valuation = current_valuation
  last_karma     = current_karma
  current_valuation = rand(100)
  current_karma     = rand(200000)
  x_size = x.sample
  y_size = y.sample

  send_event('valuation', { current: current_valuation, last: last_valuation })
  send_event('karma', { current: current_karma, last: last_karma })
  send_event('synergy',   { value: rand(100) })
  # send_event('cat', { image: 'http://placekitten.com/200/300' })
  send_event('cat', { image: "http://placekitten.com/#{x_size}/#{y_size}" })
end