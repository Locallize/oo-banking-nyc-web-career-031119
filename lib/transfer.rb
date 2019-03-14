require 'pry'

class Transfer
  attr_reader :receiver, :amount
  attr_accessor :status, :sender

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    if sender.valid? && receiver.valid?
        true
    else
       false
    end
  end

  def execute_transaction
    if sender.valid? && sender.balance < @amount
      self.status = "rejected"

      "Transaction rejected. Please check your account balance."
     
    elsif @status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete" 
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      self.status = "reversed"
    end 
  end
end
