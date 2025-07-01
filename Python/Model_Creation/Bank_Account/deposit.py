# deposit.py

from accounts import accounts

def deposit(account_number, amount):
    if account_number not in accounts:
        print("Account not found!")
        return
    accounts[account_number]["balance"] += amount
    print(f"Deposited ₹{amount} to account {account_number}")