class HouseworksController < ApplicationController
 # before_action :pairnil, only: [:new]
  before_action :authenticate_user!,except: [:index]

  def index
    if current_user
      @pair_1 = Pair.find_by(user_id: current_user.id )
      @pair_2 = Pair.find_by(partner_id:current_user.id)
      if @pair_1 = Pair.find_by(user_id: current_user.id ) || @pair_2 = Pair.find_by(partner_id:current_user.id)
        @partner = User.find_by(id: @pair_1.user_id)
        @buddy = User.find_by(id: @pair_1.partner_id)
      end
    end
    @houseworks = Housework.all
  end

  def new
    if @pair_1 = Pair.find_by(user_id: current_user.id ) || @pair_2 = Pair.find_by(partner_id:current_user.id)
      @partner = User.find_by(id: @pair_1.user_id)
      @buddy = User.find_by(id: @pair_1.partner_id)
      if @pair_1 
        @pair = @pair_1
      elsif @pair_2
        @pair = @pair_2
      else
        redirect_to root_path
      end
    end
    @housework = Housework.new
  end

  def create
    @pair_1 = Pair.find_by(user_id: current_user.id )
    @pair_2 = Pair.find_by(partner_id:current_user.id)
    if @pair_1
      @pair = @pair_1
    elsif @pair_2
      @pair = @pair_2
    end
  
    @housework = Housework.new(housework_params)
    if @housework.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pairs = Pair.find(params[:id])
    #@housework = Housework.find(params[:id])
 #   if current_user.id == @housework.user_id || current_user.id == @pair.user_id || current_user.id == @pair.partner_id
  #    @housework_partner = Housework.find_by(user_id: current_user.id)
   #   @housework_buddy = Housework.find_by(user_id: current_user.id)
   # end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def housework_params
    params.require(:housework).permit(
                                  :laundry,
                                  :dishes,
                                  :cooking,
                                  :clean_room,
                                  :bathroom,
                                  :trash,
                                  :toilet,
                                  :created_at).merge(pair_id: @pair.id)
  end
end
