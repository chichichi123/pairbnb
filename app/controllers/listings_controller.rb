class ListingsController < ApplicationController

  def index
    @listings = Listing.all.page(params[:page]).per(14).order(created_at: :desc)
    # @listings = Listing.all
    # if params[:search]
    #   @listings = Listing.search(params[:search]).order("created_at DESC")
    # else
    #   @listings = Listing.all.order("created_at DESC")
    # end
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
      flash[:error] = "There was an errror deleting your listing"
    end
  end

  def listing_params
    params.require(:user).permit(:name, :tag_list) ## Rails 4 strong params usage
  end

  def verify
    @listing = Listing.find(params[:id])
    if @listing.update(verification: "verified")
      redirect_to listings_path
      flash[:notice] = "You successfully verified your listing"

    else
      flash[:error] = "There was an errror verifying your listing"

    end
  end


  private
  def listing_params
    params.require(:listing).permit(:name, :description,:price, :tag_list, {images: []})
  end
end
