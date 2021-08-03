pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;
import "./interfaces/IERC721Cutted.sol";
import "./interfaces/IERC1155Cutted.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AirdropNFT is Ownable {
    IERC721Cutted public airi721;
    IERC1155Cutted public airi1155;

    function airdropNFT721(address[] memory receivers, uint[] memory tokenID ) public onlyOwner {
        for(uint i=0; i<receivers.length; i++){
            airi721.mint(receivers[i], tokenID[i]);
        }
    }
    function airdropNFT1155(address[] memory receivers, uint[] memory tokenID, uint[] memory amount, bytes[] memory data ) public onlyOwner {
        for(uint i=0; i<receivers.length; i++){
            airi1155.mint(receivers[i], tokenID[i], amount[i],data[i]);
        }
    }
}
