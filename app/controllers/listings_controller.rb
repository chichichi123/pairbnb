class ListingsController < ApplicationController

  def index
    @listings = Listing.all

    # @listings = current_user.listings -- !!! Shows all listings from the user!
  end


  def new
    @listing = current_user.listings.new
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing.id)
    else
      render :new
    end
  end
  def destroy
    if Listing.find(params[:id]).destroy
      flash[:notice] = "You successfully deleted your listing"
    else
      flash[:error] = "There was an errror deleeting ur listing"
    end
  end

  def listing_params
    params.require(:user).permit(:name, :tag_list) ## Rails 4 strong params usage
  end


  private
  def listing_params
    params.require(:listing).permit(:name, :description,:price)
  end
end
