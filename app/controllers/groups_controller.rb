class GroupsController < ApplicationController
  load_and_authorize_resource

  # GET /groups
  def index
    @groups = current_user.groups
  end
end
