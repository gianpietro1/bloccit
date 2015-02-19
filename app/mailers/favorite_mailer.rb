class FavoriteMailer < ActionMailer::Base
  default from: "gianpietro1@gmail.com"

  def new_comment(user, post, comment)

    # New Headers
    headers["Message-ID"] = "<comments/#{comment.id}@gianpietro-bloccit.com"
    headers["In-Reply-To"] = "<post/#{post.id}@gianpietro-bloccit.com"
    headers["References"] = "<post/#{post.id}@gianpietro-bloccit.com"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

end
