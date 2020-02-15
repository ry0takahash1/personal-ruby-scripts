require "csv"

class CsvOperation
  attr_accessor :data

  def initialize
    @data = []
  end

  def load
    CSV.foreach("./data/data.csv") do |row|
      @data.push(row)
    end
  end

  def write
    CSV.open("./data/out.csv", "wb") do |row|
      row << %w[1 Oliver Scott 14]
    end
  end

  def header
    @data.first
  end
end
