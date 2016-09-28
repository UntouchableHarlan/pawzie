module PostsHelper
  def liked_by(post, user)
    if user.voted_for?(post)
      return true
    else
      return false
    end
  end

  def display_likes(post)
    likes = post.votes_for.up.by_type(User)
    return list_likers(likes) if likes.size <= 8
    count_likers(likes)
  end

  def count_likers(likes)
    liker_count = likes.count
    liker_count.to_s + ' likes'
  end

  def like_plural(votes)
    return ' like this' if votes.count > 1
    ' likes this'
  end

  def list_likers(votes)
    user_names = []
    unless votes.blank?
      votes.voters.each do |voter|
        user_names.push(link_to voter.name,
                                user_path(voter.name),
                                class: 'name')
      end
      user_names.to_sentence.html_safe + like_plural(votes)
    end
  end
end
