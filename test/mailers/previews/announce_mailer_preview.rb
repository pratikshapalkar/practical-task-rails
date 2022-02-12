# Preview all emails at http://localhost:3000/rails/mailers/announce_mailer
class AnnounceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/announce_mailer/announcement_created
  def announcement_created
    AnnounceMailer.announcement_created
  end

end
