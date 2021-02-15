class SubscriptionChanger

  #Constructor
  def initialize(subscription)
    @subscription = subscription
  end

  def run!
    if @subscription.active?
      @subscription.charge(amount: @subscription.amount)
    else
      @subscription.charge(amount: 0)
    end
  end

end
