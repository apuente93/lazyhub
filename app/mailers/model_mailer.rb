class ModelMailer < ActionMailer::Base
  default from: "me@sandboxd62399d82de64044a3631f43e5612050.mailgun.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_record_notification(subscription)
    @subscription = subscription
    mail to: @subscription.email, subject: "Subscription: Success!"
  end
end
