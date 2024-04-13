class HouseworksController < ApplicationController
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
      if @pair_1 
        @pair = @pair_1
        @partner = User.find_by(id: @pair.user_id)
        @buddy = User.find_by(id: @pair.partner_id)
      elsif @pair_2
        @pair = @pair_2
        @partner = User.find_by(id: @pair.user_id)
        @buddy = User.find_by(id: @pair.partner_id)
      else
        redirect_to root_path
      end
    end
    @housework = Housework.new
  end

  def create
    if @pair_1 = Pair.find_by(user_id: current_user.id ) || @pair_2 = Pair.find_by(partner_id:current_user.id)
      if @pair_1 
        @pair = @pair_1
        @partner = User.find_by(id: @pair.user_id)
        @buddy = User.find_by(id: @pair.partner_id)
      elsif @pair_2
        @pair = @pair_2
        @partner = User.find_by(id: @pair.user_id)
        @buddy = User.find_by(id: @pair.partner_id)
      else
        redirect_to root_path
      end
    end
  
    @housework = Housework.new(housework_params)
    if @housework.save
      render json;{housework:@housework}
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    if @pair_1 = Pair.find_by(user_id: current_user.id ) || @pair_2 = Pair.find_by(partner_id:current_user.id)
      if @pair_1 
        @pair = @pair_1
        @partner = User.find_by(id: @pair.user_id)
        @buddy = User.find_by(id: @pair.partner_id)
      elsif @pair_2
        @pair = @pair_2
        @partner = User.find_by(id: @pair.user_id)
        @buddy = User.find_by(id: @pair.partner_id)
      else
        redirect_to root_path
      end
    end
    
    gon.buddyName = @buddy.nickname
    gon.partnerName = @partner.nickname

    gon.weekLaundryBuddy = week_counts[:laundry_buddy]
    gon.weekLaundryPartner = week_counts[:laundry_partner]
    gon.weekDishesBuddy = week_counts[:dishes_buddy]
    gon.weekDishesPartner = week_counts[:dishes_partner]
    gon.weekCookingBuddy = week_counts[:cooking_buddy]
    gon.weekCookingPartner = week_counts[:cooking_partner ]
    gon.weekCleanRoomBuddy = week_counts[:clean_room_buddy]
    gon.weekCleanRoomPartner = week_counts[:clean_room_partner]
    gon.weekBathroomBuddy = week_counts[:bathroom_buddy]
    gon.weekBathroomPartner = week_counts[:bathroom_partner]
    gon.weekTrashBuddy = week_counts[:trash_buddy]
    gon.weekTrashPartner = week_counts[:trash_partner]
    gon.weekToiletBuddy = week_counts[:toilet_buddy]
    gon.weekToiletPartner = week_counts[:toilet_partner]
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
                                  :toilet).merge(pair_id: @pair.id)
  end
end
