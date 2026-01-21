class Account
  attr_accessor :account_balance

  def initialize()
    @account_balance = my_real_life_account_balance
  end

  def increase(amount)
    @account_balance += amount
  end

  def decrease(amount)
    @account_balance -= amount
  end
end

$account = Account.new()

class Foo
  def increase_balance()
    $account.increase(1)
  end
end

class Bar
  def decrease_balance()
    $account.decrease(1)
  end
end

def yay(n)
  $account.increase(n)
end

def hey_wait(n)
  $account.decrease(n)
end