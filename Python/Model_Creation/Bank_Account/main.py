from creat_account import creat_account
from deposit import deposit
from withdraw import withdraw
from info import info

# Create account
creat_account("Alice", "12345", 5000)

# Transactions
deposit("12345", 1000)
withdraw("12345", 300)

# Show final info
info("12345")
