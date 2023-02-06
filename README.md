# [Cosmic Chicken](https://cosmic-chicken.finiam.com)

![image](https://user-images.githubusercontent.com/2940022/217004391-0823b9ca-8d0a-44ed-ab63-512f36391052.png)


## Motivation

One of the current challenges in the Filecoin network is the lack of lending options.
This is particularly relevant for the onboarding of new Storage Providers (SPs) to the network.

In order for a Storage provider to be accepted into the network, it first needs to deposit a large amount of collateral.
The collateral needed is directly related to how much storage a new SP aims to provide to the network. The more storage, the higher
the collateral needed. 

Also, the Filecoin network has a large base of long-term token holders that are willing to lend their FIL to reputable and growth-oriented SPs.
In the past, some lending partners have stepped up in order to provide this collateral but they are not able to service everyone.

With undercollateralized lending, lenders can help provide the collateral needed for the onboarding of a storage provider, while being exposed
to the opportunity of getting some yield on their loan. This yield comes from mining new blocks by the storage providers. The rewards from that
are sent to our protocol until the storage providers have repaid their loan.

Lastly, [Chicken Bonds](https://www.chickenbonds.org/) can help provide liquidity to a new protocol. This can be used as a way to bootstrap the
protocol liquidity.

With the Cosmic Chicken project we aim to solve this issue by applying the use of the novel Chicken Bonds mechanism to the Filecoin network
as a way to kickstart the Filecoin lending ecosystem.

## How it works

Storage providers can borrow collateral from the Pool

Lenders can provide liquidity to the Pool by minting a bond

When an SP requests a loan, our protocol deposits the full amount needed by the SP on its behalf. In order to request a loan,
an SP first needs to deposit 50% of the full amount to the Cosmic Chicken Staking Pool.
Our protocol will lock the future income coming from the block rewards until the storage providers have repaid their loan

![image](https://user-images.githubusercontent.com/2940022/217022584-609abbdc-1bfc-4ca1-ba6a-1deb98bce63b.png)

### Cosmic Chicken Bond

- Standard ERC-721 token, that represents a loan by the lender.
- Lenders can decide to `Chicken In`, by relinquishing the initial capital and getting the yield generated by the protocol
- Lenders can also `Chicken out`, by relinquishing the accumulated yield and getting the initial capital back
- The rewards generated from the mining of new blocks from the Storage Providers are sent to the Pool, generating yield.

![image](https://user-images.githubusercontent.com/2940022/217019616-a851e092-1a97-46c5-94f1-04658a4bed13.png)

### Cosmic Chicken internal logic

- All funds deposited by lenders are stored in the `Pending Bucket`
- The `Permanent Bucket` stores the funds acquired by the protocol from users that have `Chicken In` or `Chicken Out`
- `Reserve Bucket` keeps the yield generated from `Pending` and `Permanent` buckets
- `$vbFIL` is the virtual balance representing a claim of the `Reserve Bucket`
- `$bFIL` is the token minted that can claim ETH from the `Reserve Bucket` at a redemption price

## How we made it

### Smart contracts

We used a [Foundry](https://github.com/foundry-rs/foundry) project in order to develop the smart contracts needed for this project.

You can check the deployed contracts in Hyperspace here:

Bond: `0xdB1819F57d9023a948da930C10dea248CdBfdad8`

Pool: `0x7c75BCC74204696f513A3412a4A039f6D319b6C6`

bFIL: `0x7cb38f2139Eb8830DEb7aB9650Cf655CE48d8D2F`

ChickenBondManager: `0x60361121F74cE943D5cAFe0FBb98315A2eb2095b`

### Frontend

For the frontend, we created a [Next.js](https://github.com/vercel/next.js/) app. We used `ethers.js` and `wagmi` for the 
smart contract and wallet interactions needed

The repo for the frontend is in the `frontend` folder as a submodule but also [here](https://github.com/finiam/cosmic-chicken-frontend) 
as its own project.

It is deployed using [Netfliy](https://netlify.com) and you can check it at https://cosmic-chicken.finiam.com


---


Project for the [FVM Space Warp hackathon](https://ethglobal.com/events/spacewarp) by ETHGlobal
