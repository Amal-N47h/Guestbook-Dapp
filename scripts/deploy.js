const hre = require("hardhat");

async function main() {
  const g = await hre.ethers.deployContract("Guestbook");
  await g.waitForDeployment();
  console.log("Guestbook deployed to:", await g.getAddress());
}

main().catch((e) => { console.error(e); process.exit(1); });
