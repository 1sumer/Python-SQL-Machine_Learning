from accounts import accounts

def creat_account(account_name, account_number, balance):
    if account_number in accounts:
        print("Account already exists!")
        return
    accounts[account_number] = {
        "name": account_name,
        "balance": balance
    }
    print(f"Account Created -> {account_number}, {account_name}")
    print("Balance:", balance)