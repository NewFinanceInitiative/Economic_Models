import numpy as np
import matplotlib.pyplot as plt

# --- Simulation settings ---
weeks = 10
btc_supply = 21_000_000  # fixed supply
agents = 10  # number of economic participants
spend_rate = 0.3  # fraction of BTC agents spend weekly
initial_price = 100  # price per "good" in satoshis

# --- State variables ---
price_level = [initial_price]
velocity = []
output = []

# --- Agent BTC balances (start equal) ---
balances = np.full(agents, btc_supply / agents)

# --- Simulation loop ---
for week in range(weeks):
    # spending: each agent spends a fraction of their balance
    spending = balances * spend_rate
    total_spending = np.sum(spending)
    
    # output: total goods bought at current price
    goods_bought = total_spending / price_level[-1]
    
    # velocity: total spending / total BTC in circulation
    v = total_spending / btc_supply
    
    # simple price adjustment: price rises if more spending
    new_price = price_level[-1] * (1 + (v - 0.1))
    
    # update balances (assume perfect redistribution)
    balances -= spending
    balances += spending / agents
    
    # record
    price_level.append(new_price)
    velocity.append(v)
    output.append(goods_bought)

# --- Plot results ---
weeks_range = np.arange(weeks)

plt.figure(figsize=(10,6))

plt.subplot(3,1,1)
plt.plot(weeks_range, price_level[:-1], label="Price Level")
plt.ylabel("BTC Price per Good")
plt.legend()

plt.subplot(3,1,2)
plt.plot(weeks_range, velocity, label="Velocity", color="orange")
plt.ylabel("Velocity of BTC")
plt.legend()

plt.subplot(3,1,3)
plt.plot(weeks_range, output, label="Output (Goods)", color="green")
plt.ylabel("Goods Produced")
plt.xlabel("Weeks")
plt.legend()

plt.tight_layout()
plt.show()