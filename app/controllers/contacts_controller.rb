class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def show
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contacts_path, notice: "Contact successfully Added!"
    else
      render :new
    end
  end
  
  def update
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "Contact was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    notice = @contact.destroy ? "Contact was successfully destroyed." : "Failed destroy"
    redirect_to contacts_path, notice: notice
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :number, :email)
  end
end

