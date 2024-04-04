class HouseworksController < ApplicationController
 # before_action :pairnil, only: [:new]
  before_action :authenticate_user!,except: [:index]

  def index
    if current_user
      @pair = Pair.find_by(user_id: current_user.id, partner_id:current_user.id )
      if @pair
        @pair_users = User.where(id: [@pair.user_id, @pair.partner_id])
      end
    end
  end

  def new
    @housework = Housework.new
  end

  def create
    @housework = Housework.new(housework_params)
    if @housework.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def pairnil
      @pair = Pair.find_by(user_id: current_user.id )
      if @pair
        @pair_users = User.where(id: [@pair.user_id, @pair.partner_id])
        if @pair_users.id == current_user.id
          redirect_to new_pair_path
        end
      else
        redirect_to root_path
      end
  end

  def housework_params
    params.require(:housework).permit(
                                  :laundry,
                                  :dishes,
                                  :cooking,
                                  :clean_room,
                                  :bathroom,
                                  :trash,
                                  :toilet,
                                  :created_at).merge(user_id: current_user.id)
  end
end
