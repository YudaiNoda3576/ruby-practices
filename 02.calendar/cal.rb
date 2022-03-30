#!/usr/bin/env ruby
require 'Date'
require 'optparse'

#今日の日付を生成する
today = Date.today

options = ARGV.getopts("y:", "m:")

year = (options['y'] || today.year).to_i
month = (options['m'] || today.month).to_i

#今月の開始曜日を調べるD
first_day = Date.new(year, month, 1).wday
# 当月の最終日を調べる
last_day = Date.new(year, month, -1).day
#最終日を基準に日付の配列を作成する
#範囲オブジェクトを使用しsplat展開を行う
days_of_month = [*1..last_day]
#開始曜日毎に配列に空白を追加する
first_day.times do
  days_of_month.unshift(" ")
end

#今月が何週かを確認する
weeks_count = 4
weeks_count += 1 if days_of_month.length % 7 > 0

#カレンダータイトルの作成
calender_title = Date.new(year, month, 1).strftime("%-m月 %Y")
calender_head = %w[日 月 火 水 木 金 土]

#カレンダーの出力
puts calender_title.center(21, " ")
puts " " + calender_head.join(" ")

#ある週分timesを回す
weeks_count.times do
  #1週分の内容weekにセットする
  week = days_of_month.shift(7)
  #1週分を出力する
  week.each_with_index do |w, i|
    i == 6 ? printf("%3s\n", w) : printf("%3s", w)
  end
end

