// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Guestbook {
    struct Entry {
        address author;
        string text;
        uint256 timestamp;
    }

    Entry[] private entries;

    event MessagePosted(address indexed author, string text, uint256 timestamp);

    function postMessage(string calldata text) external {
        require(bytes(text).length > 0 && bytes(text).length <= 280, "1-280 chars");
        entries.push(Entry(msg.sender, text, block.timestamp));
        emit MessagePosted(msg.sender, text, block.timestamp);
    }

    function getMessages() external view returns (Entry[] memory) {
        return entries;
    }

    function count() external view returns (uint256) {
        return entries.length;
    }
}
