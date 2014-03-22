/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar Bplus;
    @members {
                int max = 30000;
                int index = 0;
                int[] bfmemory = new int[max];
                private void execStatement(String input){
                    int len = input.length();
                    for(int i=0; i<len; i++){
                        if('>' == input.charAt(i)){ index += 1; }
                        else if('<' == input.charAt(i)){ index -= 1; }
                        else if('+' == input.charAt(i)){ bfmemory[index] += 1; }
                        else if('-' == input.charAt(i)){ bfmemory[index] -= 1; }
                        else if('.' == input.charAt(i)){ System.out.print((char)bfmemory[index]);}
                        else if('H' == input.charAt(i)){ System.out.println("HelloWorld"); }
                        else if('F' == input.charAt(i)){ 
                          for(int j=0; j<100; j++){
                              if(j%15==0) System.out.println("FizzBuzz");
                              else if(j%5==0) System.out.println("Fizz");
                              else if(j%3==0) System.out.println("Buzz");
                              else System.out.println(j);
                          }
                        }
                    }
                }
              }

whole
    : block*
    ;

block
    : ( atomblock
      | whileblock
      )+
    ;

whileblock
    : WHILEBEGIN
      statement { while(bfmemory[index]>0){
                        execStatement($statement.cmd);
                        } 
                   } 
      WHILEEND
    ;

atomblock
    : statement { execStatement($statement.cmd);}
    ;

statement returns [String cmd]
    : ( PLUS { $cmd += ">"; }
      | MINUS { $cmd += "<"; }
      | IDXPLUS { $cmd += "+"; }
      | IDXMINUS { $cmd += "-"; }
      | OUT {$cmd += "."; }
      | HELLO { $cmd += "H"; }
      | FIZZBUZZ { $cmd += "F"; }
      )+
    ;

WS: [ \r\t\n]+ -> skip ;

PLUS : '>' ;

MINUS : '<' ;

IDXPLUS : '+' ;

IDXMINUS : '-' ;

OUT : '.' ;

WHILEBEGIN : '[';

WHILEEND : ']';

HELLO : 'H';

FIZZBUZZ : 'F'; 