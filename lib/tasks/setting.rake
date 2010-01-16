class Rake::Task
  def self.sanitize_and_execute(sql)
    sanitized = if Rails::VERSION::STRING < "2.3.3"
      ActiveRecord::Base.send(:sanitize_sql, sql)
    else # Rails 2.3.3 introduced extra "table_name" parameter.
      ActiveRecord::Base.send(:sanitize_sql, sql, nil)
    end
    ActiveRecord::Base.connection.execute(sanitized)
  end
end

namespace :edss do

  namespace :settings do
    desc "Load default application settings"
    task :load => :environment do
      plugin = ENV["PLUGIN"]
      yaml = RAILS_ROOT + (plugin ? "/vendor/plugins/#{plugin}" : "") + "/config/settings.yml"
      begin
        settings = YAML.load_file(yaml)
      rescue
        puts "Couldn't load #{yaml} configuration file."
        exit
      end

      # Truncate settings table if loading Fat Free CRM settings.
      ActiveRecord::Base.establish_connection(Rails.env)
      unless plugin
        if ActiveRecord::Base.connection.adapter_name.downcase == "sqlite"
          ActiveRecord::Base.connection.execute("DELETE FROM settings")
        else # mysql and postgres
          ActiveRecord::Base.connection.execute("TRUNCATE settings")
        end
      end

      settings.keys.each do |key|
        if plugin # Delete existing plugin setting if any (since we haven't truncated the whole table).
          sql = [ "DELETE FROM settings WHERE name = ?", key.to_s ]
          Rake::Task.sanitize_and_execute(sql)
        end
        sql = [ "INSERT INTO settings (name, default_value, created_at, updated_at) VALUES(?, ?, ?, ?)", key.to_s, Base64.encode64(Marshal.dump(settings[key])), Time.now, Time.now ]
        Rake::Task.sanitize_and_execute(sql)
      end
    end

    desc "Show current application settings"
    task :show => :environment do
      ActiveRecord::Base.establish_connection(Rails.env)
      names = ActiveRecord::Base.connection.select_values("SELECT name FROM settings ORDER BY name")
      names.each do |name|
        puts "\n#{name}:\n  #{Setting.send(name).inspect}"
      end
    end
  end

end
