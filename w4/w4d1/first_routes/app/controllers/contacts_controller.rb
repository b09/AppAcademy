class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprotected_entity
    end
  end

  def index
    @contacts = Contact.owned_and_shared(params[:id])
    render json: @contacts
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprotected_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: @contact
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
