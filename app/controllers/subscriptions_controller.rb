class SubscriptionsController < ApplicationController
  protect_from_forgery

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      # queue a task to send a confirmation email (see below)
      ModelMailer.new_record_notification(@subscription).deliver
      redirect_to root_path, :notice => 'Thanks for signing up.'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:email)
    end
end
