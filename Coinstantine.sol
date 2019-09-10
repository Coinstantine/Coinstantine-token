pragma solidity ^0.5.10;

import 'NotTransferable.sol';

contract Coinstantine is NotTransferable {

    string constant public Name = "Coinstantine";

    string constant public Symbol = "CSN";

    uint8 constant public Decimals = 18;

    uint256 public TotalSupply = 10 ** (8 + 18); // 100_000_000

    constructor() public {
        enabledTransfer = true;
        balance[msg.sender] = TotalSupply;
    }

    function totalSupply() public view returns (uint256 supply) {
        return TotalSupply;
    }
}