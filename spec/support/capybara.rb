# 全システムテストを rack_testで実行
RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by(:rack_test)
  end
end
