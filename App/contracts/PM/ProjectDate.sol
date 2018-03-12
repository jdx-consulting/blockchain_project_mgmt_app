pragma solidity ^0.4.17;

contract ProjectDate {
    uint public Day;
    uint public Month;
    uint public Year;

    

   function isLaterDate(ProjectDate other) public view returns(bool) {
       if (other.Year() > this.Year()) {
           return true;
       } else if (other.Year() < this.Year()) {
           return false;
       } else if (other.Month() > this.Month()) {
           return true;
       } else if (other.Month() < this.Month()) {
           return false;
       }
   } 
}