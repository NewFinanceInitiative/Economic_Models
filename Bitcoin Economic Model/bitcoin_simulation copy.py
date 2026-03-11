import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Set initial parameters
weeks = 10
btc_supply = 20_000_000  # Total BTC in circulation
initial_velocity = 4

# Agents and their BTC holdings
agents = {
    'A1': {'type': 'consumer', 'btc': 1.0, 'spending_rate': 0.2, 'preferences': {'food': 0.6, 'rent': 0.3, 'energy': 0.1}},
    'A2': {'type': 'producer', 'btc': 0.5, 'produces': 'food'},
    'A3': {'type': 'producer', 'btc': 1.2, 'produces': 'rent_energy'},
    'A4': {'type': 'consumer', 'btc': 2.0, 'spending_rate': 0.4, 'preferences': {'services': 0.5, 'food': 0.5}},
}

# Goods and their properties
goods = {
    'food': {'price': 0.5, 'supply_per_week': 100, 'producer': 'A2'},
    'rent': {'price': 1.0, 'supply_per_week': 30, 'producer': 'A3'},
    'energy': {'price': 0.2, 'supply_per_week': 200, 'producer': 'A3'},
    'services': {'price': 0.3, 'supply_per_week': 100, 'producer': 'A2'},
}

# For tracking over time
price_levels = []
btc_velocity = []
outputs = []
total_transactions = []

# Simulation loop
for week in range(weeks):
    weekly_output = 0
    weekly_transactions = 0

    for agent_id, agent in agents.items():
        if agent['type'] == 'consumer':
            budget = min(agent['btc'], agent['spending_rate'])
            for good, weight in agent['preferences'].items():
                spending = budget * weight
                price = goods[good]['price']
                qty = spending / price
                if goods[good]['supply_per_week'] >= qty:
                    goods[good]['supply_per_week'] -= qty
                    producer_id = goods[good]['producer']
                    agents[producer_id]['btc'] += spending
                    agent['btc'] -= spending
                    weekly_output += qty
                    weekly_transactions += 1

    # Reset weekly supply
    for good in goods:
        goods[good]['supply_per_week'] = goods[good]['supply_per_week']

    # Aggregate price level (weighted average)
    total_value = sum(goods[g]['price'] * goods[g]['supply_per_week'] for g in goods)
    total_units = sum(goods[g]['supply_per_week'] for g in goods)
    price_level = total_value / total_units if total_units > 0 else 0

    # Velocity = (weekly transactions * average price) / total BTC supply
    avg_price = price_level
    velocity = (weekly_transactions * avg_price) / btc_supply if btc_supply > 0 else 0

    price_levels.append(price_level)
    btc_velocity.append(velocity)
    outputs.append(weekly_output)
    total_transactions.append(weekly_transactions)

# Plot results
fig, axs = plt.subplots(3, 1, figsize=(10, 10))

axs[0].plot(price_levels, label="BTC Price Level (P)")
axs[0].set_title("BTC Price Level Over Time")
axs[0].set_ylabel("BTC per unit")
axs[0].legend()

axs[1].plot(btc_velocity, label="Velocity of BTC (V)", color='orange')
axs[1].set_title("BTC Velocity Over Time")
axs[1].set_ylabel("Velocity")
axs[1].legend()

axs[2].plot(outputs, label="Weekly Output (Y)", color='green')
axs[2].set_title("Total Output Produced")
axs[2].set_ylabel("Units")
axs[2].legend()

plt.xlabel("Week")
plt.tight_layout()
plt.show()