class AnnouncementsController < ApplicationController

	before_filter :hidden_announcement_ids

	def hide
  	respond_to do |format|
    	format.html { redirect_to :back }
    	format.js { render json: nil, status: :ok }
  	end
	end

	def show
		@announcement = Announcement.find(params[:id])
    return redirect_to @announcement.link unless @announcement.link.blank?
    redirect_to :back
	end

	private

	def hidden_announcement_ids
		ids = [params[:id], *cookies.signed[:hidden_announcement_ids]]
  	cookies.permanent.signed[:hidden_announcement_ids] = ids
	end

end
