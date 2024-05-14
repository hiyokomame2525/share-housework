class PairsController < ApplicationController
  before_action :authenticate_user!

  def new
    @pair = Pair.new
  end

  def create
    @pairs = Pair.all
    @pair = Pair.new(pair_params)
    partner = User.find_by(id: pair_params[:partner_id])
    unless @pairs.exists?(user_id: partner.id) && @pairs.exists?(partner_id: partner.id)
      @pair.save
      redirect_to root_path and return
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    if user_signed_in?
      @pair_1 = Pair.find_by(user_id: current_user.id )
      @pair_2 = Pair.find_by(partner_id: current_user.id)

      if current_user.id == @pair_1.user_id
        @pair_delete = @pair_1
        @pair_delete.destroy
        redirect_to root_path
      elsif current_user.id == @pair_2.partner_id
        @pair = @pair_2
        @pair_delete.destroy
        redirect_to root_path
      else
        flash.now[:alart] = "ペアの解除に失敗しました"
        redirect_to root_path
      end
    end
  end

  private
    def pair_params
      params.require(:pair).permit(:user_id, :partner_id)
    end

end
