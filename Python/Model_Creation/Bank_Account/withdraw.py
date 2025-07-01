from accounts import accounts

def withdraw(account_number, amount):
    if account_number not in accounts:
        print("Account not found!")
        return
    if accounts[account_number]["balance"] < amount:
        print("Insufficient balance!")
        return
    accounts[account_number]["balance"] -= amount
    print(f"Withdrew ₹{amount} from account {account_number}")
