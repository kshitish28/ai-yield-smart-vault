
# ai_router.py
import random

def get_best_strategy():
    strategies = ['LP Farming', 'Staking', 'Lending']
    apys = {s: round(random.uniform(5.0, 15.0), 2) for s in strategies}
    best = max(apys, key=apys.get)
    return best, apys

if __name__ == "__main__":
    strategy, details = get_best_strategy()
    print("Best Strategy:", strategy)
    print("APYs:", details)
