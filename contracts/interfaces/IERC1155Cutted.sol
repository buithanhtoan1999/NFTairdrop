

pragma solidity >=0.6.2 <0.8.0;



/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC1155Cutted {
    function mint(address _to,uint256 _tokenId, uint256 _amount, bytes memory data ) external ;
}