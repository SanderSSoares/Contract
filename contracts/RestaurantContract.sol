// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//Define the restaurant contract
contract Restaurant {

    address public owner;
    uint public ownerBalance;

    struct MenuItem {

        string name; //Name of the Item (Burgers, Ceg)
        uint price;  //Price in Wel (coin)
    }

    //Mapping to store menu items

    mapping(uint => MenuItem) public menu;
    uint public menuItemCount;

    event MenuItemAdded (uint ItemId, string Name, uint price);
    event OrderPlaces(address customer, uint itemId, uint quantity, uint totalCost);
    event PaymentReceived(address customer, uint amount);

    //Function that only the Owner can do, not customer
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this function");
        _; //_ control the access on Solidity
    }

    constructor(){
        owner = msg.sender;

    }

    function addMenuItem(String memory _name, uint _price) public onlyOwner {
        menu[menuItemCount] = MenuItem(_name, _price);
        emit MenuItemAdded(menuItemCount, _name, _price);
        menuItemCount++;
    }

    Function placeOrder(uint _itemId, uint _quantity) public payable {
        require(_itemId < menuItemCount, "Invalid menu item");
        uint totalCost = item.price * _quantity;
        require(msg.value == totalCost, "Incorrect payment amount")
    }
}