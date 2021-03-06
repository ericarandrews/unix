-Unix/Linux Bash Shell Scripting
-Create a function library script which contains any functions and aliases.
-Based on input from the user, enable or disable debugging.
    	•set -x
	•set +x
      
-Terminal Output:
        bash-3.2$ script myscript.sh
        Script started, output file is myscript.sh
        bash-3.2$ 
        bash-3.2$ # Debugging Function Library
        bash-3.2$ 
        bash-3.2$ ################################################################################## 
        bash-3.2$ set -x


-Use a trap to output some message before the program exits when a user hits Control-C.
-Use a trap to execute your 'cleanup' function from your function library when the program exists.
-Create a 'cleanup' function which will simply output a nice message that you're cleaning things up.
 
-Terminal Output: 
        trap 'an_exit; exit' SIGINT SIGTERM
        function cleanup(){
          echo "I am cleaning up"
        }
        function an_exit(){
          echo "Ctrl-C entered, now exiting..."
        }
        trap cleanup EXIT

-Terminal Output:
        bash-3.2$ ##################################################################################
        bash-3.2$ #Use a trap to output some message before the program exits when a user hits Control-C.
        bash-3.2$ #Use a trap to execute your 'cleanup' function from your function library when the program exists.
        bash-3.2$ #Create a 'cleanup' function which will simply output a nice message that you're cleaning 
        things up.
        bash-3.2$ trap 'an_exit; exit' SIGINT SIGTERM
        + trap 'an_exit; exit' SIGINT SIGTERM
        bash-3.2$ function cleanup(){
        > echo "I am cleaning up"
        > }
        bash-3.2$ function an_exit(){
        > echo "Ctrl-C entered, now exiting..."
        > }
        bash-3.2$ trap cleanup EXIT
        + trap cleanup EXIT
        bash-3.2$ 


-Create a function that takes 3 parameters. The first is a function to call, the 2nd is the variable name to 
set to the output of that function call, the 3rd variable is the parameter(s) to the function. 

-Terminal Output: 
        function thisfunc(){
          echo "This is a function to call"
        }
        function setval(){
          $1
          $2
          $3
        }
        thisvar=$(thisfunc)
        thisfuncparam=$(setval thisfunc)
        setval thisfunc "echo $thisvar" "echo $thisfuncparam"

-Terminal Output:
        bash-3.2$ ##################################################################################
        bash-3.2$ #Create a function that takes 3 parameters. The first is a function to call, the 
        2nd is the variable name to set to the output of that function call, the 3rd variable is the 
        parameter(s) to the function.
        bash-3.2$ function thisfunc(){
        > echo "This is a function to call"
        > }
        bash-3.2$ function setval(){
        > $1
        > $2
        > $3
        > }
        bash-3.2$ thisvar=$(thisfunc)
        ++ thisfunc
        ++ echo 'This is a function to call'
        + thisvar='This is a function to call'
        bash-3.2$ thisfuncparam=$(setval thisfunc)
        ++ setval thisfunc
        ++ thisfunc
        ++ echo 'This is a function to call'
        + thisfuncparam='This is a function to call'
        bash-3.2$ setval thisfunc "echo $thisvar" "echo $thisfuncparam"
        + setval thisfunc 'echo This is a function to call' 'echo This is a function to call'
        + thisfunc
        + echo 'This is a function to call'
        This is a function to call
        + echo This is a function to call
        This is a function to call
        + echo This is a function to call
        This is a function to call
        bash-3.2$ 


-Create a function that will output the extension of a file name (i.e. if given "log.txt", it will return "txt).
 
-Terminal Output: 
       function extension(){
          string=$1
          echo ${string##*.}
        }
        extension log.txt
        extension script.sh
        
-Terminal Output:        
        bash-3.2$ ##################################################################################
        bash-3.2$ #Create a function that will output the extension of a file name (i.e. if given 
        "log.txt", it will return "txt").
        bash-3.2$ 
        bash-3.2$ function extension(){
        > string=$1
        > echo ${string##*.}
        > }
        bash-3.2$ extension log.txt
        + extension log.txt
        + string=log.txt
        + echo txt
        txt
        bash-3.2$ extension script.sh
        + extension script.sh
        + string=script.sh
        + echo sh
        sh
        
        
-Create a function that will output the base name of a file name (i.e. if given "log.txt", it will return "log").

-Terminal Output:        
        function basename(){
          string=$1
          echo ${string%.*}
        }
        basename script.sh
        basename log.txt

-Terminal Output:
        bash-3.2$ ###################################################################################
        bash-3.2$ #Create a function that will output the base name of a file name (i.e. if given "log.txt", it will return "log). 
        bash-3.2$ function basename(){
        > string=$1
        > echo ${string%.*}
        > }
        bash-3.2$ basename script.sh
        + basename script.sh
        + string=script.sh
        + echo script
        script
        bash-3.2$ basename log.txt
        + basename log.txt
        + string=log.txt
        + echo log
        log

-Create a(n) alias(es) which executes some of your common commands, including any combination of functions.
-Specifically, make one alias called "setthat" which uses setval to set a variable called "that" .. "setthat somefunc".
-Make at least one alias that calls another alias. 
-Create at least 4 aliases total and use each of them somewhere in your scripts. 
  
 -Terminal Output: 
       function myfunction(){
          alias sl=ls
          sl
          alias dwp=pwd
          dwp
          alias setthat=ls -l
          alias setval=setthat
          alias that=setval
          that
          something="Did you say something"
          alias saysomething="echo $something"
          saysomething
          alias etad=date
          alias d=etad
          d
         }

-Terminal Output:
         bash-3.2$ alias sl=ls
         + alias sl=ls
         bash-3.2$ sl
         + ls
         500			
         =		 	
         Applications	        
         Creative Cloud Files	
         Desktop		
         Documents	 	
         Downloads			  
         IdeaProjects		
         Library		
         Movies			
         Music			
         Pictures		
	 Public		 
	 myscript.sh
         cleanuptrap.sh 	  
	 out.log
	 doit.sh		  
	 output.log
	 echo		  
	 redirection
	 }
	 file1		  
	 s.sh
	 function_example.sh
	 sayword.sh
	 functio	
	 hello.s		  
	 started
	 my.sh		  
	 test.sh 
	 myfunctions.sh
	 myscript
	 
-Terminal Output:
         bash-3.2$ alias dwp=pwd
         + alias dwp=pwd
         bash-3.2$ dwp
         + pwd
         /Users/ericaandrews

-Terminal Output:
         bash-3.2$ alias setthat=ls
         + alias setthat=ls
         bash-3.2$ alias setval=setthat
         + alias setval=setthat
         bash-3.2$ alias that=setval
         + alias that=setval
         bash-3.2$ that
         + ls
         500			
         =		 	
         Applications	        
         Creative Cloud Files	
         Desktop		
         Documents	 	
         Downloads			  
         IdeaProjects		
         Library		
         Movies			
         Music			
         Pictures		
	 Public		 
	 myscript.sh
         cleanuptrap.sh 	  
	 out.log
	 doit.sh		  
	 output.log
	 echo		  
	 redirection
	 }
	 file1		  
	 s.sh
	 function_example.sh
	 sayword.sh
	 functio	
	 hello.s		  
	 started
	 my.sh		  
	 test.sh 
	 myfunctions.sh
	 myscript

-Terminal Output:
         bash-3.2$ something="Did you say something"
         + something='Did you say something'
         bash-3.2$ alias saysomething="echo $something"
         + alias 'saysomething=echo Did you say something'
         bash-3.2$ saysomething
         + echo Did you say something
         Did you say something

-Terminal Output:
         bash-3.2$ set +x
         + set +x
         bash-3.2$ exit
         I am cleaning up

         Script done, output file is myscript.sh	


