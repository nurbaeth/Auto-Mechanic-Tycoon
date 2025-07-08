# 🛠️ Auto Mechanic Tycoon      
    
A simple on-chain game built with Solidity where **you are the mechanic**. Repair virtual cars, upgrade your garage (soon™), and build your reputation — all on the Ethereum blockchain. No tokens. No staking. Just pure logic and gameplay stored on-chain.  
    
## 🚗 Gameplay Overview    
        
In this game, you:  
    
- 🔧 Register as a mechanic    
- 🧰 Repair up to 3 cars per day     
- 🌟 Earn reputation points for every successful repair  
- 📈 Compete with others to become the top-rated mechanic     
      
Every action is a transaction on-chain. There are no off-chain tricks — what you see is what the blockchain sees.  
    
## ⚙️ Smart Contract  
   
The game is written in Solidity. It uses:  
- Daily repair limits (resets every 24h)   
- On-chain reputation tracking    
- Stateless repair system (no NFTs or tokens required)  
    
```solidity  
function repairCar() external onlyRegistered {  
    ...  
    reputation += 10;  
} 
