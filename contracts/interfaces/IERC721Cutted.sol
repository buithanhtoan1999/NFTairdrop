// SPDX-License-Identifier: MIT

pragma solidity >=0.6.2 <0.8.0;



/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721Cutted {
    function mint(address _to,uint256 _tokenId ) external ;
}
