pragma solidity ^0.5.10;

contract Ownable {
    address payable public admin;

  /**
   * @dev The Ownable constructor sets the original `admin` of the contract to the sender
   * account.
   */
    constructor() public {
        admin = msg.sender;
    }

  /**
   * @dev Throws if called by any account other than the admin.
   */
    modifier onlyAdmin() {
        require(msg.sender == admin, "Function reserved to admin");
        _;
    }

  /**
   * @dev Allows the current admin to transfer control of the contract to a new admin.
   * @param _newAdmin The address to transfer ownership to.
   */

    function transferOwnership(address payable _newAdmin) public onlyAdmin {
        require(_newAdmin != address(0), "New admin can't be null");
        admin = _newAdmin;
    }

    function destroy() public onlyAdmin {
        selfdestruct(admin);
    }

    function destroyAndSend(address payable _recipient) public onlyAdmin {
        selfdestruct(_recipient);
    }
}