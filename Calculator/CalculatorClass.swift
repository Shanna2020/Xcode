//
//  CalculatorClass.swift
//  Calculator
//
//  Created by user199511 on 9/29/21.
//

import Foundation
import UIKit

class CalculatorClass{
    
    var arrayString:[String]=[]
    var errorVar = 9999999
    var modeVar = false
    
    //Push function///////////////////////////////////////////////////////
    
    func push(data: String){
        
        arrayString.append(data)
        
    }//end of push function
    
    //pop function ////////////////////////////////////////////////////////
    
    func pop()
    {
        arrayString.removeAll();
        
    }
   
    //mode function////////////////////////////////////////////////////////
    
    func mode()->BooleanLiteralType
    {
        //changes the mode variable each time the button is clicked
        if modeVar==false
        {
            modeVar=true
                     
        }else{
            modeVar=false
                   
        }

        return modeVar
    }// end of mode
    
    
    
    
 /////////////////////Calc Function////////////////////////////////////
 func calc()-> Int{
    var calNum:Int=0 , secNum=0;
     var i=0 , j=0, fnumtest = 0, snumtest = 0;
     
     //Allow testing of number of operand
     let testNum = ["9":1,"8":1, "7":1 , "6":1, "5":1, "4":1, "3":1, "2":1, "1":1, "0":1 , "+":2, "-":2, "*":2]
     

     
if arrayString.isEmpty
{ //test if array is empty
    return errorVar
}
else{
     
while(j < arrayString.count)
{ //control looping through string to check same operation
 if fnumtest==0 //testing for first number
 {
      for (num, numValue) in testNum //get the key and value from testNum
     {
         if(num==arrayString[j])
         {
            fnumtest = numValue //assigning tthe value to the first variable
            if fnumtest==2{return errorVar} //if first number is not a number return error
          }
         
      } //end for
     
 } else{ // if it is not the first number
         for (num, numValue) in testNum
         {
             if num==arrayString[j]
             {
             snumtest = numValue //assign the value of second variable
             }
         } //end for
         if ((fnumtest == 1 && snumtest==1) || (fnumtest == 2 && snumtest==2)) //test the values of first variable and second variable
         {
            return errorVar //return error variable if they are the same

         } else{
             fnumtest=snumtest //assign value of second number to first number if they are not
                 }
     } //close else
 j+=1
 
} //end while
   
}//end else
     
  //Calculating numbers//////////////////////////////////////////
while i < arrayString.count
 {
     if calNum == 0
     {
        calNum = Int(arrayString[0])!
       i+=1
     } // check the first number
      //do calculation based on operands
    switch arrayString[i]{
         case"+":
             
             secNum = Int(arrayString[i+1])!
             calNum+=secNum
             
         case"-":
             
             secNum = Int(arrayString[i+1])!
             calNum-=secNum
         case"*":
             secNum = Int(arrayString[i+1])!
            calNum*=secNum
         case"/":
             secNum = Int(arrayString[i+1])!
             calNum=calNum / secNum
                  
         default:
            calNum+=0


     }// end switch

     i+=1

 }//end while

    return calNum
 
 } //end of calc function

    
}// end of calculationclass
