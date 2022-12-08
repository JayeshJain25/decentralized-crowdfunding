// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Crowdfunding {

   mapping (address => mapping (uint256 => Gig)) private s_gigs; 
   mapping (address => uint256) private s_gigsCount;


  struct Gig {
        address caller;
        string title;
        string description;
        uint256 amountToRaise;
    }

    function addGig(string memory _title,string memory _description, uint256 _amountToRaise) public {

        s_gigs[msg.sender][getGigsCount()] = Gig(msg.sender,_title,_description,_amountToRaise);
        s_gigsCount[msg.sender] =   s_gigsCount[msg.sender]+1;

    }

    function getGigs(uint256 index) public view  returns (Gig memory) {
        return s_gigs[msg.sender][index];
        
    }

    function getGigsCount() public view returns (uint256) {
        return s_gigsCount[msg.sender];
        
    }

  
}