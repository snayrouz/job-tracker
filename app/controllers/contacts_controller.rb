class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]

    @contact.save
    flash[:success] = "#{contact.name} was successfully created!"
    redirect_to company_path(@contact.company)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email, :company_id)
  end
end
