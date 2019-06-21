module ListsHelper

  def list_user?(list)
    list.user == current_user
  end
end
