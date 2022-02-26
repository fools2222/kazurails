class InquiryMailer < ApplicationMailer
  
    def send_mail(inquery)
        @inquery = inquery
        mail(
            from: 'system@example.com',
            to:   ENV["URL"],
            subject: 'お問い合わせ通知'
        )
    end
    
end
