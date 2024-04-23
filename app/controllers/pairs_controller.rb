class PairsController < ApplicationController
  before_action :authenticate_user!

  def new
    @pair = Pair.new
  end

  def create
    @pairs = Pair.all
    @pair = Pair.new(pair_params)
    partner = User.find_by(id: pair_params[:partner_id])
    if @pairs.exists?(user_id: partner.id) && @pairs.exists?(partner_id: partner.id)
      @pair.save
      redirect_to root_path and return
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @pair.user_id || @pair.partner_id
       @pair.destroy
      redirect_to root_path
    else
      flash.now[:alart] = "ペアの解除に失敗しました"
      redirect_to root_path
    end
  end

  private
    def pair_params
      params.require(:pair).permit(:user_id, :partner_id)
    end

end
