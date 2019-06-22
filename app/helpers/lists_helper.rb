module ListsHelper

  def list_user?(list)
    list.user == current_user
  end

  def u_vote(user, list)
    if user.favorited?(list)
      @fav_vote = FavoriteList.find_by(user_id: user.id, list_id: list.id)
      if @fav_vote.vote == nil || @fav_vote.vote == 0
        @fav_vote.vote = 1
        @fav_vote.save
        redirect_to list_path(list), notice: "Vote recorded!"
      else
        redirect_to list_path(list), alert: "Unable to vote, perhaps you already did."
      end
    else
      redirect_to list_path(list), alert: "You must favorite list to to vote."
    end
  end

  def d_vote(user, list)
    if user.favorited?(list)
      @fav_vote = FavoriteList.find_by(user_id: user.id, list_id: list.id)
      if @fav_vote.vote == 1
        @fav_vote.vote -=1
        @fav_vote.save
        redirect_to list_path(list), notice: "Vote recorded!"
      else
        redirect_to list_path(list), alert: "Unable to vote, perhaps you already did."
      end
    else
      redirect_to list_path(list), alert: "You must favorite list to to vote."
    end
  end
end
