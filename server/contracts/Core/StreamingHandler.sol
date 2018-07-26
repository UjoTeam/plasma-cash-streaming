pragma ^0.4.24;

import "./Streams.sol";

contract StreamingHandler {

    address plasma;
    Streams stream;
    mapping(uint256 => address) artistIdtoAddress;
    uint256 currId = 0;

    event Stream(string _cid, address _streamer, uint256 _artistId, address _artist, uint256 _tokenId);

    constructor (address _plasma, address _stream) {
        plasma = _plasma;
        stream = Stream(_stream);
    }

    function registerArtist() {
        artistIdtoAddress[currId] = msg.sender;
        currId++;
    }

    function streamSong(string _cid, uint256 _artistId, uint256 _tokenId) {
        require(stream.balanceOf(msg.sender) >=1);
        stream.safeTransferFrom(msg.sender,artistIdtoAddress[_artistId], _tokenId);
        emit Stream(_cid, msg.sender, _artistId,artistIdtoAddress[_artistId], _tokenId);
    }
}