module AnnouncementsHelper
  def hello_bar
  	render 'announcements/index', locals: {announcements: Announcement.current}
  end
end
