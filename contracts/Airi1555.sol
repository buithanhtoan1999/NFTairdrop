pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract Airi1155 is Ownable, ERC1155 {
    mapping(address => bool) public isMinter;

    modifier onlyMinter(address _minter) {
        require(isMinter[_minter],"Minter? Wut");
        _;
    }
    constructor() public ERC1155("a"){
        isMinter[msg.sender] = true;
    }
    
    function mint(address account, uint256 id, uint256 amount, bytes memory data) public onlyMinter(msg.sender) {
        _mint(account, id, amount, data);
    }
    function setMinter(address _newMinter) public onlyOwner {
        isMinter[_newMinter] = true;
    }
    function removeMinter(address _minter) public onlyOwner {
        require(isMinter[_minter], "Not minter");
        isMinter[_minter] = false;
    }
}