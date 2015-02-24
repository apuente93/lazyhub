class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "LazyHub: Contact",
      :to => "postmaster@sandbox782110f976d142299d364a7d6f5de357.mailgun.org",
      :from => %("#{name}" <#{email}>)
    }
  end
end