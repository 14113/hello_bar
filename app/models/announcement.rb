require "date_validator"

class Announcement < ActiveRecord::Base
  attr_accessible :starts_at, :ends_at, :message, :link

  validates :link, :format => URI::regexp(%w(http https))
  validates :starts_at, :date => { :after => lambda { |*ignores| Time.current } }, :allow_blank => true
  validates :ends_at, :date => { :after => :starts_at }, :allow_blank => true

  def self.current(hidden_ids = nil)
  	result = where("(starts_at <= :now and ends_at >= :now) OR starts_at IS :null", now: Time.current, null: nil)
  	result = result.where("id not in (?)", hidden_ids) if hidden_ids.present?
  	result
	end

end
