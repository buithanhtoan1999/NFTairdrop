pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Owable.sol";
contract Airi1155 is Ownable, ERC1155 {
    mapping(address => bool) public isMinter;
    
    modifier onlyMinter() {
        require(isMinter);
        _;
    }
    constructor() public ERC1155(""){
        isMinter[msg.sender] = true;
    }
    
    function mint(address to, uint256 tokenId) public onlyMinter {
        _mint( to, tokenId);
    }
    function setMinter(address _newMinter) onlyOwner {
        isMinter[_newMinter] = true;
    }
    function removeMinter(address _minter) onlyOwner {
        require(isMinter[_minter], "Minter: Wut?");
        isMinter[_minter] = false;
    }
}
