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
}