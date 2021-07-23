class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contacts_path, notice: "Contact successfully Added!"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :number, :email)
  end
end

