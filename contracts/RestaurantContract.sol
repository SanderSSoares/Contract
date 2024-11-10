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
}