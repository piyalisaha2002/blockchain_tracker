// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.12;

contract SupplyChain {
     

    event Added(uint256 index);
    
    struct State{
        string description;
        address person;
    }
    
    struct Product{
        address creator;
        string productName;
        uint256 productId;
        string date;
        uint256 totalStates;
        string time;
        mapping (uint256 => State) positions;
    }
    struct Track_Info{
        uint256 parcel_ID;
        string parcel_hash;
        string location;
        string vehicle_id;
        string status;
    }
   
    
    mapping(uint256=>Track_Info) public track_details;

    mapping(uint256=>address[]) public outward_history;

    mapping(uint => Product) allProducts;
    uint256 items=0;

     
    
    function concat(string memory _a, string memory _b) public returns (string memory){
        bytes memory bytes_a = bytes(_a);
        bytes memory bytes_b = bytes(_b);
        string memory length_ab = new string(bytes_a.length + bytes_b.length);
        bytes memory bytes_c = bytes(length_ab);
        uint k = 0;
        for (uint i = 0; i < bytes_a.length; i++) bytes_c[k++] = bytes_a[i];
        for (uint i = 0; i < bytes_b.length; i++) bytes_c[k++] = bytes_b[i];
        return string(bytes_c);
    }
    
    function newItem(string memory _text, string memory _date, string memory _time) public returns (bool) {
        Product memory newItem = Product({creator: msg.sender, totalStates: 0,productName: _text, productId: items, date: _date, time: _time});
        allProducts[items]=newItem;
        items = items+1;
        emit Added(items-1);
        return true;
    }
    
    function addState(uint _productId, string memory info) public returns (string memory) {
        require(_productId<=items);
        
        State memory newState = State({person: msg.sender, description: info});
        
        allProducts[_productId].positions[ allProducts[_productId].totalStates ]=newState;
        
        allProducts[_productId].totalStates = allProducts[_productId].totalStates +1;
        return info;
    }
    
    function searchProduct(uint _productId) public returns (string memory) {

        require(_productId<=items);
        string memory output="Product Name: ";
        output=concat(output, allProducts[_productId].productName);
        output=concat(output, "<br>Manufacture Date: ");
        output=concat(output, allProducts[_productId].date);
        
        for (uint256 j=0; j<allProducts[_productId].totalStates; j++){
            output=concat(output, allProducts[_productId].positions[j].description);
        }
        return output;
        
    }
    function parcel_departed(uint256 _parcelID,string memory _location,string memory _vID) public {
        track_details[_parcelID].location=_location;
        track_details[_parcelID].vehicle_id=_vID;
        outward_history[_parcelID].push(msg.sender);
        
    }

    function change_Location(uint256 _parcelID,string memory _location) public {
        track_details[_parcelID].location=_location;
    }
    
    function parcel_hand_over(uint256 _parcelID,address _reciepient) public{
            uint last=outward_history[_parcelID].length-1;
            address _givenby=outward_history[_parcelID][last];
            //checking correct person is hand over the parcel
            require(msg.sender==_givenby);
            //hand over the parcel to _reciepient
             outward_history[_parcelID].push(_reciepient);
    }

    function update_StatusAsDelivered(uint256 _parcelID) public {
        track_details[_parcelID].status="Delivered";
    }

    function set_hash_for_parcel(uint256 _parcelID,string memory _parcelHash) public {
        track_details[_parcelID].parcel_hash=_parcelHash;
    }
}