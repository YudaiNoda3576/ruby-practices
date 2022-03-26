# !/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')

shots = []

scores.each do |s|
  if s == 'X' # strikeの場合一投目が10、二投目が0
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = shots.each_slice(2).to_a

case frames.size
when 11 # 10フレーム目に３投目が存在する場合
  frames << frames[-2].concat(frames.last)
when 12 # 10フレーム目に３投目が存在するかつ２本以上ストライクがある場合
  frames << frames[-3].concat(frames[-1], frames.last)
end
frames = frames.slice(0, 10)

score = frames.each_with_index.sum do |frame, i|
  if i < 9
    next_first_throw = frames[i + 1][0]
    next_second_throw = if next_first_throw == 10 && i != 8
                          frames[i + 2][0]
                        else
                          frames[i + 1][1]
                        end
    if frame[0] == 10 # strikeの場合
      10 + next_first_throw + next_second_throw
    elsif frame.sum == 10 # spareの場合
      10 + next_first_throw
    else
      frame.sum
    end
  else
    frame.sum
  end
end

p score
