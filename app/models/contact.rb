class Contact < MailForm::Base
  validate_phone =
    attribute :nom, validate: true
  attribute :tel, validate: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/i
  attribute :email,     validate: /\A([\w.%+\-]+)@([\w\-]+\.)+(\w{2,})\z/i
  attribute :message,   validate: true
  attribute :nickname,  captcha: true

  def headers
    {
      subject: "Formulaire de contact",
      to: "MetalB.bastien.j@gmail.com",
      from: %("#{nom}" <#{email}>)
    }
  end
end
