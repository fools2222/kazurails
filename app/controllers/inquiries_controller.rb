class InquiriesController < ApplicationController
    def new 
        @inquiry = Inquiry.new
    end
    def confirm
        @inquiry = Inquiry.new(inquiry_params)
        if @inquiry.invalid?
            redirect_to new_inquiry_path
        end
    end
    def back 
        @inquiry = Inquiry.new(inquiry_params)
        redirect_to  new_inquiry_path
    end
    def create 
        @inquiry = Inquiry.new(inquiry_params)
        if @inquiry.save
            InquiryMailer.send_mail(@inquiry).deliver_later
            redirect_to new_inquiry_path
        else
            redirect_to new_inquiry_path
        end
    end
    private 

    def inquiry_params 
        params.require(:inquiry).permit(:email,:name,:message)
    end 
end
