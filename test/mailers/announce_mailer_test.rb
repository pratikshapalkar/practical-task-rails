require 'test_helper'

class AnnounceMailerTest < ActionMailer::TestCase
  test "announcement_created" do
    mail = AnnounceMailer.announcement_created
    assert_equal "Announcement created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
