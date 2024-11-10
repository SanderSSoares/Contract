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
        menuItem memory item = menu[_itemId];
        uint totalCost = item.price * _quantity;
        require(msg.value == totalCost, "Incorrect payment amount");
        ownerBalance += msg.value;
        emit OrderPlaced(msg.sender, _itemId, _quantity, totalCost);
        emit PaymentReceived(msg.sender, msg.value);

    }

    function withdrawBalance() public onlyOwner{
        uint amount = ownerBalance;
        ownerBalance = 0;
        payable(owner).transfer(amount);
    }

    function getMenuItem(uint _itemId) public view returns (string memory name, uint price){
        require(_itemId < menuItemCount, "Invalid menu Item.");
        MenuItem memory item = menu[_itemId];
        return (item.name, item.price);
    }
}