require 'spec_helper'

require File.join(File.dirname(__FILE__), '..', '..', 'app', 'models', 'announcement')

describe Announcement do
  it "has current scope" do
    passed = create_announcement starts_at: 1.day.ago, ends_at: 1.hour.ago
    current = create_announcement starts_at: 1.hour.ago, ends_at: 1.day.from_now
    stable = create_announcement starts_at: nil, ends_at: nil
    upcoming = create_announcement starts_at: 1.hour.from_now, ends_at: 1.day.from_now
    Announcement.current.should eq([current,stable])
  end

  def create_announcement(attributes)
    announcement = Announcement.new
    attributes.each do |key, value|
      announcement.send("#{key}=", value)
    end
    announcement.save!( :validate => false )
    announcement
  end

end