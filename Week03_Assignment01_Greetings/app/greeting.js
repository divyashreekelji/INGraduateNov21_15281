function greetingMessage(msg){
  var output=msg;
  switch(output){
        case "New Year":
          console.log("Happy New Year "+output);
          break;
        case "christmas":
              console.log("Marry christmas "+output);
              break;
        case "Birthday":
              console.log("Happy Birthday"+output);
              break;
        case "Christmas":               
                console.log("Marry Christmas "+output);
                break;      
      
        default  :
              console.log("Please enter valid option..!!"+output);
              break; 
  }
}
module.exports=greetingMessage;