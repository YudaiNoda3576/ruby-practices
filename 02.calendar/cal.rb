#!/usr/bin/env ruby
# frozen_string_literal: true
require 'Date'
require 'optparse'

# 今日の日付を生成する
today = Date.today

options = ARGV.getopts('y:', 'm:')

year = (options['y'] || today.year).to_i
month = (options['m'] || today.month).to_i

first_wday = Date.new(year, month, 1).wday

last_day = Date.new(year, month, -1).day

days_of_month = [*1..last_day]

weeks_count = 4
weeks_count += 1 if (days_of_month.length % 7).positive?

# 開始曜日毎に配列に空白を追加する
first_wday.times do
  days_of_month.unshift(' ')
end

calender_title = Date.new(year, month, 1).strftime('%-m月 %Y')
calender_head = %w[日 月 火 水 木 金 土]

puts calender_title.center(21, ' ')
puts ' ' + calender_head.join(' ')

weeks_count.times do
  week = days_of_month.shift(7)
  week.each { |w| printf('%3s', w) }
  print("\n")
end
