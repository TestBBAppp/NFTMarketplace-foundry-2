// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../src/ERC20.sol";
import "../src/Marketplace.sol";
import "../src/ERC721.sol";

contract DeployMarket is Script {

    function run() public {
        vm.startBroadcast();

        // Deploy contracts 20 times
        for (uint256 i = 0; i < 1; i++) {
            // Deploy MoonToken
            MoonToken moonToken = new MoonToken();
            console.log("MoonToken deployed to:", address(moonToken));

            // Deploy NFTMarket
            NFTMarket nftMarket = new NFTMarket(address(moonToken));
            console.log("NFTMarket deployed to:", address(nftMarket));

            // Deploy MyNFT
            MyNFT nft = new MyNFT(address(nftMarket));
            console.log("MyNFT deployed to:", address(nft));
      }

        vm.stopBroadcast();
    }
}
