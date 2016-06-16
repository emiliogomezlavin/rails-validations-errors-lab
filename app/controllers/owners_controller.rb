class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      flash[:notice] = "Owner created!"
      redirect_to owner_path(@owner)
    else
      flash[:error] = @owner.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def edit
    @owner = Owner.find(params[:id])
    render :edit
  end

  def update
    @owner = Owner.find(params[:id])
    if @owner.update_attributes(owner_params)
      flash[:notice] = "Owner information updated!"
      redirect_to owner_path(@owner)
    else
      flash[:error] = @owner.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @owner = Owner.find(params[:id])
    if @owner.destroy
      redirect_to owners_path
    else

    end
  end


  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone)
  end

end
