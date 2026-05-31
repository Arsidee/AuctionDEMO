class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.recent.includes(:lot)
    current_user.notifications.unread.update_all(read: true)
  end
end
