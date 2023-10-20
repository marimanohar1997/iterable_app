# frozen_string_literal: true

class NotifyMailer < SendGridMailer

  def send_notify(to_contact, subject, mail_body)
    dispatch(to_contact, subject, mail_body)
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.info e
    Rails.logger.info '---- Sending mail failed ----'
  end

end
