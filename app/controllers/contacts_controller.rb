class ContactsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(params[:contact])
    # @contact.request = request
    if @contact.deliver
      flash[:notice] = nil
      redirect_to root_path, notice: "Message envoyé"
    else
      flash[:alert] = "Le message n'a pas pus s'envoyer"
      render :new
    end
    authorize @contact
  end
end
