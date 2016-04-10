require "net/http"
require "json"
require "aes"
require_relative "../integrations/todoist"

class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action do
    if not Todoist.connected?(current_user)
      flash[:alert] = "You have to connect a todo app first."
      redirect_to todo_apps_connect_path
    end
  end

  def index
    @items = Todoist.items(current_user, flash)

    if not @items
      redirect_to todo_apps_connect_path
    end
  end

end