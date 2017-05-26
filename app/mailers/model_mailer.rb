class ModelMailer < ActionMailer::Base
  default from: "mailgun@lazyhub.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_record_notification(subscription)
    @subscription = subscription
    mail to: @subscription.email, subject: "Subscription: Success!"
  end

  def new_record_notification(record)
  @record = record
  mail to: "mailgun@lazyhub.com", subject: "Success! You did it."
end
end
