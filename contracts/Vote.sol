//SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.9;

contract NigeriaDecide{
    // Voting contract that allows candidate to register..
    // Registered voters can vote
    // Only registerd candidate can be vote for..
    // Allows for checking of leading or winners candidate.
    address public winner;
    uint public winnerVotes;
    address public owner;
    address[] public candidateList;

    mapping(address => uint) voteCounts;


    constructor(){
        owner = msg.sender;
    }

    function registerCandidate(address _candidate) external {
        require(owner == msg.sender, "You're not the owner");
        candidateList.push(_candidate);
    }

    function CandidateVal(address _candidate) private view returns(bool){
        for (uint i = 0; i <= candidateList.length; i++){
            if(candidateList[i] == _candidate){
                return true;
            }
        }
        return false;
    }

    function voteFavCandidate(address _candidate) external{
        require (CandidateVal(_candidate), "Candidate doesn't exist!");
        voteCounts[_candidate] +=1;
    }

    function candidateVote(address _candidate) external view returns(uint){
        require(owner == msg.sender, "You are not the owner");
        require (CandidateVal(_candidate), "Candidate doesn't exist!");
        return voteCounts[_candidate];
    }

    function Outcome() public {
        for(uint i = 0; i<candidateList.length; i++){
            if(voteCounts[candidateList[i]] > winnerVotes){
                winnerVotes = voteCounts[candidateList[i]];
                winner = candidateList[i];
            }

        }
    }

}