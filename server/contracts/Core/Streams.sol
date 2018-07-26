pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";


contract Streams is ERC721Token("Streams", "ST") {

    address plasma;
    uint256 streamPrice;
    constructor (address _plasma, uint256 _streamPrice) public {
        plasma = _plasma;
        streamPrice = _streamPrice;
    }

    function registerUser(uint256 _amount) external payable {
        // Users can buy any number of streams with a minimum of at least 10.
        require(_amount >= 10);
        require(msg.value == streamPrice * _amount);
        for (int j = 0; j < amount; j++) {
            create();
        }
    }

    function depositToPlasmaWithData(uint tokenId, bytes _data) public {
        require(plasma != address(0));
        safeTransferFrom(
            msg.sender,
            plasma,
            tokenId,
            _data);
    }

    function depositToPlasma(uint tokenId) public {
        require(plasma != address(0));
        safeTransferFrom(msg.sender, plasma, tokenId);
    }

    function create() private {
        uint256 tokenId = allTokens.length + 1;
        _mint(msg.sender, tokenId);
    }

}
