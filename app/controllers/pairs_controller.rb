class PairsController < ApplicationController
  before_action :authenticate_user!

  def new
    @pair = Pair.new
  end

  def create
    partner_id = params[:partner_id]
    partner = User.find_by(id: partner_id)
    @pair = Pair.new(pair_params)
    if @pair.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    pair = current_user.unfollow()
    if pair.destroy
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

    def unfollow(other_user)
      pair = self.pairs.find_by(partner_id: other_user.id)
      pair.destroy if pair
    end

    def following?(other_user)
      self.buddy.include?(other_user)
    end
end
