class SendGridMailer < ActionMailer::Base

  def dispatch(to_contact, subject, mail_body)
    from_email = Rails.application.credentials[:sendgrid_from_email]
    sendgrid_email_key = Rails.application.credentials[:sendgrid_email_key]
    to_email = SendGrid::Email.new(email: to_contact)
    content = SendGrid::Content.new(type: 'text/html', value: mail_body)
    sg_mail = SendGrid::Mail.new(from, subject, to_email, content)
    sg = SendGrid::API.new(api_key: sendgrid_email_key)
    sg.client.mail._('send').post(request_body: sg_mail.to_json)
    Rails.logger.info '====================== Mailer send Successfully   ============================'
  rescue StandardError => e
    Rails.logger.info "====================== Mailer failed #{e.to_json}   ============================"
  end
  
end
