pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract GameAssetExchange {
    
    // Define the struct for the game assets
    struct GameAsset {
        string name;
        uint256 value;
        address owner;
    }

    // Define the mapping for the game assets
    mapping(uint256 => GameAsset) public gameAssets;
    uint256 public gameAssetCount;

    // Define the event for asset exchange
    event AssetExchanged(
        uint256 indexed assetId,
        address indexed oldOwner,
        address indexed newOwner,
        uint256 value
    );

    // Define the function for creating a new game asset
    function createGameAsset(string memory _name, uint256 _value) public {
        GameAsset memory newAsset = GameAsset(_name, _value, msg.sender);
        gameAssets[gameAssetCount] = newAsset;
        gameAssetCount++;
    }

    // Define the function for exchanging game assets
    function exchangeGameAsset(uint256 _assetId, address _newOwner) public payable {
        GameAsset storage asset = gameAssets[_assetId];
        require(address(this).balance >= asset.value, "Insufficient or excess Ether sent.");
        address payable oldOwner = payable(asset.owner); // Convert old owner address to a payable address
        asset.owner = _newOwner;
        oldOwner.transfer(asset.value); // Send the asset value amount of Ether to the old owner
        emit AssetExchanged(_assetId, oldOwner, _newOwner, asset.value);
    }


    function transferEther(address payable recipient, uint256 amount) public {
        require(address(this).balance >= amount, "Insufficient balance.");
        recipient.transfer(amount);
    }

}
