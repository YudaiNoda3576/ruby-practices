#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

class ListSegments
  MAX_COLUMN = 3

  def main
    options = {}

    OptionParser.new do |opt|
      opt.on('-a') { |a| options[:a] = a }
      opt.parse!(ARGV)
    end

    children = what_kind_of_option(options)

    child_max_length = children.map(&:length).max

    output_row = children.size.ceil / 3

    sliced_by_row = slice_children_each_row(children, output_row)

    sorted_arry = sorted_arry_factory(output_row, sliced_by_row)

    results = output_arry_factory(sorted_arry)

    results.each do |items|
      puts items.map { |item|
        format("% -#{child_max_length}s ", item) unless item.nil?
      }.join
    end
  end

  private

  # @param [Object] row
  # @param [Object] children
  # @return [Array]
  def slice_children_each_row(children, row)
    sliced_by_row = []
    children.each_slice(row) do |items|
      sliced_by_row << items.map { |item| item }
    end
    sliced_by_row
  end

  # @param [Object] row
  # @param [Object] sliced_by_row
  # @return [Array]
  def sorted_arry_factory(row, sliced_by_row)
    tmp_arry = []
    row.times do |i|
      sliced_by_row.each do |item|
        tmp_arry << item[i]
      end
      i += 1
    end
    tmp_arry
  end

  # @param [Object] arry
  # @return [Array]
  def output_arry_factory(arry)
    arry.each_slice(MAX_COLUMN).map { |items| items.map { |item| item } }
  end

  # @param [Object] options
  # @return [Array<String>]
  def what_kind_of_option(options)
    flag = options[:a]? File::FNM_DOTMATCH: 0
    Dir.glob('*', flag)
  end
end

ListSegments.new.main
