// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//inherited ERC721 contract
contract VirtualLand is ERC721{
    //created a struct to store information abount land 
    struct land{
        string name;
        string location;
        string description;
    }

    //mapping to map land with id
    mapping(uint=> land) public Lands;
    constructor()ERC721("VirtualLand","VLandNFT"){}

//function to mint NFT and add information to struct.
    function mintNFT(uint _tokenId, string memory _name, string memory _location, string memory _description) external{
        require(!_exists(_tokenId),"Token id already exists"); //check token id already exists or not
        land memory newLand = land(_name,_location,_description); //adding information to struct
        Lands[_tokenId] = newLand;
        _safeMint(msg.sender, _tokenId);
    }

    function getLand(uint _tokenId) external view returns(string memory name, string memory location ,string memory description){
        require(_exists(_tokenId),"Token id does not exists"); //checking token id is exists or not 
        land storage Land = Lands[_tokenId];
        return(Land.name,Land.location,Land.description);
    }
}