namespace :passenger do
  
  desc 'Generate passenger environment'
  task :env => :environment do
    ruby_api_version = RbConfig::CONFIG['ruby_version']
    passenger_root = Bundler.with_clean_env { `rbfu @#{RUBY_VERSION} passenger-config --root 2>/dev/null` }.strip
    raise "Passenger root not found" unless File.exist?(passenger_root)
    env = []
    env << %{PATH="/opt/rubies/#{RUBY_VERSION}/bin:/usr/local/bin:/usr/bin"}
    env << %{PASSENGER_ROOT="#{passenger_root}"}
    env << %{GEM_HOME="/opt/rubies/#{RUBY_VERSION}/lib/ruby/gems/#{ruby_api_version}"}
    env << %{GEM_PATH="/opt/rubies/#{RUBY_VERSION}/lib/ruby/gems/#{ruby_api_version}"}
    env << %{PASSENGER_OPTS="#{ENV['PASSENGER_OPTS']}"}
    file = Rails.root.join('config', 'passenger.env')
    file.open('w') { |f| f << env.join("\n") << "\n" }
    puts "\nGenerated passenger environment in #{file}:\n\n"
    env.each { |l| puts "    #{l}" }
    puts
  end
  
end
