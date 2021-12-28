const ps=require('prompt-sync');
const prompt=ps();
const greetingMessage=require('./greeting')
function main(){
    let choice=prompt("Enetr your Choice :");
     greetingMessage(choice);
}

main();