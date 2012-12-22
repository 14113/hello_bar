# Create a rails app
module HelloBar
  class Application < Rails::Application
  end
end

# Run migrations
project_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
require File.join project_root, 'lib', 'generators', 'hello_bar', 'templates', 'migration.rb'

ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => ":memory:"
)

ActiveSupport.on_load(:active_record) do
  attr_accessible(nil)
end

CreateAnnouncements.suppress_messages { CreateAnnouncements.up }

ActiveRecord::Migration.create_table :announcements do |t|
      t.text :message
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :link

      t.timestamps
end

