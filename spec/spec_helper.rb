# Start CodeClimate test coverage report.
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

# Include shared examples
Dir["./spec/support/**/*.rb"].sort.each { |f| require f}

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  #Remove uploaded files
  RSpec.configure do |config|
    config.after(:each) do
      if Rails.env.test?
        FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"])
      end
    end
  end

end
