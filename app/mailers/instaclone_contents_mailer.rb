class InstacloneContentsMailer < ApplicationMailer 
  def instaclone_contents_mail(instaclone_content)
    @instaclone_content = instaclone_content
    mail to: @instaclone_content.user.email, subject: "投稿の作業が行われました"
  end
end
