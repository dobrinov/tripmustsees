namespace :code_climate do
  task upload_test_coverage_report: :environment do
    `CODECLIMATE_REPO_TOKEN=c2411eb4d76b36b9d4de6351f6c7130bbbe015be76f83ef66a252b8c01ec0ded bundle exec rspec`
  end
end
