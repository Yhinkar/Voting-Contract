import { ethers } from "hardhat";

async function main() {

  const vote= await ethers.getContractFactory(
    "NigeriaDecide"
  );
  const Vote= await vote.deploy();
  await Vote.deployed();

  console.log("Vote deployed to: ", Vote.address);

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });