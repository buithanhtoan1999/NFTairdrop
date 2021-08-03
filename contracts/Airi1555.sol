pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC1555/ERC1555.sol";
import "@openzeppelin/contracts/access/Owable.sol";
contract Airi1155 is Ownable, ERC1155 {
    mapping(address => bool) public isMinter;

    modifier onlyMinter() {
        require(isMinter,"Minter? Wut");
        _;
    }
    constructor() public ERC1155("a"){
        isMinter[msg.sender] = true;
    }
    
    function mint(address account, uint256 id, uint256 amount, bytes memory data) public onlyMinter {
        _mint(account, id, amount, data);
    }
    function setMinter(address _newMinter) onlyOwner {
        isMinter[_newMinter] = true;
    }
    function removeMinter(address _minter) onlyOwner {
        require(isMinter[_minter], "Not minter");
        isMinter[_minter] = false;
    }
}