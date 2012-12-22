require 'rails/generators/active_record/migration'

class HelloBarGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  extend ActiveRecord::Generators::Migration

  desc "Put routes and migration in place"
  source_root File.join(File.dirname(__FILE__), "templates")

  def install
    create_routes
    begin
      migration_template "migration.rb", "db/migrate/create_announcements.rb"
    rescue
    end
    default_data
  end

  private

  def default_data
    announcement = Announcement.new({
      starts_at: 1.day.ago, 
      ends_at: 1.day.from_now, 
      message: "My first announcement about github.com", 
      link: "http://github.com"
    })
    announcement.save!( :validate => false )
  end

  def create_routes
    routes = File.open(Rails.root.join("config/routes.rb")).try :read
    gsub_file "config/routes.rb", /match "announcements\/:id\/hide", to: "announcements#hide", as: "hide_announcement"/, ''
    gsub_file "config/routes.rb", /match "announcements\/:id\/show", to: "announcements#show", as: "show_announcement"/, ''
    route("match 'announcements/:id/hide', to: 'announcements#hide', as: 'hide_announcement'")
    route("match 'announcements/:id/show', to: 'announcements#show', as: 'show_announcement'")
  end

end
