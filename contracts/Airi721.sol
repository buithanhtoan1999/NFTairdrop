pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract Airi721 is Ownable, ERC721 {
    mapping(address => bool) public isMinter;
    
    modifier onlyMinter(address _minter)  {
        require(isMinter[_minter]);
        _;
    }
    constructor() public ERC721("AiriNFT","AiRi"){
        isMinter[msg.sender] = true;
    }
    
    function mint(address to, uint256 tokenId) public onlyMinter(msg.sender) {
        _mint( to, tokenId);
    }
    function setMinter(address _newMinter) public onlyOwner {
        isMinter[_newMinter] = true;
    }
    function removeMinter(address _minter) public onlyOwner {
        require(isMinter[_minter], "Minter: Wut?");
        isMinter[_minter] = false;
    }
}
