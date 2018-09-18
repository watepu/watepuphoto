class SubmitMailer < ApplicationMailer
  def submit_mail(picture)
    @picture = picture
    mail to:@picture.user.email, subject:"画像を投稿しました"
  end
end
