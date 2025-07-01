from accounts import accounts

def info(account_number):
    if account_number not in accounts:
        print("Account not found!")
        return
    acc = accounts[account_number]
    print(f"Account Number: {account_number}")
    print(f"Account Name: {acc['name']}")
    print(f"Balance: ₹{acc['balance']}")
