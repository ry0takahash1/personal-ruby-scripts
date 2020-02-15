require "minitest/autorun"
require "minitest/reporters"
require "./lib/csv_operation"

Minitest::Reporters.use!

# CSV操作テスト
class CsvOperationTest < Minitest::Test
  # 初期化テスト
  def test_initialize
    csv_operation = CsvOperation.new
    assert_equal(csv_operation.data, [])
  end

  # 読み込みテスト
  def test_load
    csv_operation = CsvOperation.new
    csv_operation.load
    assert_equal(csv_operation.data[1], ["1", "Aaron", "Howard", "11"])
    assert_equal(csv_operation.data[2], ["2", "Clark", "Philips", "15"])
    assert_equal(csv_operation.data[3], ["3", "Lara", "Stephen", "12"])
    assert_equal(csv_operation.data[4], ["4", "Nina", "Watson", "17"])
  end

  # 書き込みテスト
  def test_write
    csv_operation = CsvOperation.new
    csv_operation.write
    CSV.foreach("./data/out.csv") do |row|
      assert_equal(row, ["1", "Oliver", "Scott", "14"])
    end
  end

  # ヘッダーテスト
  def test_header
    csv_operation = CsvOperation.new
    csv_operation.load
    assert_equal(csv_operation.header[0], "id")
    assert_equal(csv_operation.header[1], "first_name")
    assert_equal(csv_operation.header[2], "family_name")
    assert_equal(csv_operation.header[3], "age")
  end
end
