-Unix/Linux Bash Shell Scripting
-Write a bash shell script which does the following:
  -Uses a simple if statement to test for existence of a file:
      
      $ if [ -e Desktop/Untitled.txt ]
      > then
      > echo "Untitled.txt file exists"
      > else
      > echo "Untitled.txt file does not exists"
      > fi
      Untitled.txt file exists
      
   -If the file exists display the file size and name:
      (you can get the file size using the ls or stat commands -- man stat; man ls;)
      
      $ ls Desktop
      Screen Shot 2018-03-02 at 12.11.48 PM.png
      Untitled.txt
      aa_certificates_resume_transcripts
      basicFaxCover.pages
      basicFaxCover.pdf
      photos
      shell_scripting
      volunteer
      
      $ stat Desktop
      16777220 615608 drwx------ 15 ericaandrews staff 0 510 "Jul 17 13:51:37 2018" 
      "Jul 17 13:51:22 2018" "Jul 17 13:51:22 2018" "Jul  8 15:33:09 2015" 4096 0 0 Desktop
    #############################################################################################

  -Use an if/then/else statement to check if a particular directory exists:
  -If it does exist, then output a friendly message indicating the directory exists: 
      
      $ if [ -d Desktop ]
      > then
      > echo "Desktop does exists"
      > else
      > echo "Desktop does not exists"
      > fi
      Desktop does exists
      
  -If it doesn't exist, then create the directory:
      
      $ if [ -d Untitled ]
      > then
      > echo "Desktop does exists"
      > else
      > echo "Desktop does not exists"
      > fi
      Desktop does not exists
      $ mkdir Untitled
      $ if [ -d Untitled ]
      > then
      > echo "Desktop does exists"
      > else
      > echo "Desktop does not exists"
      > fi
      Desktop does exists
      #############################################################################################

  -Use an if/elif statement to test input from the user:
  (use the read command to capture the input)
  -Output something useful for each condition:
    -Test for the following values:
      -number < 10, number between 50 and 100, number > 500
        and then anything else: 
      
      $ echo -n "Enter a number > "
      Enter a number > $ read character
      501
      $ if [ "$character" > "500" ]; then
      > echo "You entered a number greater than five hundred."
      > elif [ "$character" >= "50" && "$character" <= "100" ]; then
      > echo "You entered a number greater than or equal to 50 and less than or equal to 100."
      > elif [ "$character" < "10" ]; then
      > echo "You entered a number less than 10."
      > else
      > echo "The number entered applies to one or more of the following conditions: "
      > echo "Greater than or equal to 10"
      > echo "Greater than 100"
      > echo "Less than 50"
      > echo "Less than or equal to 500"
      > echo "Not a number"
      > fi
      You entered a number greater than five hundred.

-Use a switch statement to implement the same conditions as the if/elif above:

      $ echo -n "Enter a number > "
      Enter a number > $ read character
      101
      $ case $character in
      > 1 ) echo "You entered a number greater than five hundred."
      >     ;;
      > 2 ) echo "You entered a number greater than or equal to fifty and less than or equal to one hundred."
      >     ;;
      > 3 ) echo "You entered a number less than ten."
      >     ;;
      > * ) echo "The number entered applies to one or more of the following conditions: "
      >     echo "Greater than or equal to ten"
      >     echo "Greater than one hundred"
      >     echo "Less than fifty"
      >     echo "Less than or equal to five hundred"
      >     echo "Not a number"
      > esac
      The number entered applies to one or more of the following conditions: 
      Greater than or equal to ten
      Greater than one hundred
      Less than fifty
      Less than or equal to five hundred
      Not a number
    #############################################################################################

-Write a for loop which iterates through all the files in the current directory (*?):
  -For each one, output whether it is a file or a directory:
  
      $ for i in desktop/*
      > do
      > {
      >   if [[ -f $i ]]
      >   then
      >     echo "$i is a file"
      >   elif [[ -d $i ]]
      >   then
      >     echo "$i is directory"
      >   fi
      > }
      > done
      desktop/Screen Shot 2018-03-02 at 12.11.48 PM.png is a file
      desktop/Untitled.txt is a file
      desktop/aa_certificates_resume_transcripts is directory
      desktop/basicFaxCover.pages is a file
      desktop/basicFaxCover.pdf is a file
      desktop/photos is directory
      desktop/shell_scripting is directory
      desktop/volunteer is directory
    #############################################################################################

-Write a for loop which starts at 7, increments by 3, and ends when the number is >37:
  -Output the number of each iteration of the loop
  
      $ for (( i=7; i<=37; i+=3 ))
      > do
      >   echo $i
      > done
      7
      10
      13
      16
      19
      22
      25
      28
      31
      34
      37
   #############################################################################################
  
-Write a script which implements a until loop:
  -Ask the user to enter a number:
  -Keep asking until the number is >10:

      until [[ $character -gt 10 ]]
      > do
      > }
      >   read character
      >   echo "Number = $character"
      > }
      > done 
      2
      Number = 2
      4
      Number = 4
      6
      Number = 6
      8
      Number = 8
      10
      Number = 10
      12
      Number = 12
    #############################################################################################

-Write a script which implements a while loop: 
  -Ask the user a yes or no question: 
  -Keep asking until the answer is yes:
    (also known as "a conversation with a 2 year old."):
  
      $ while true
      > do
      > {
      >   read -p "Are you ok? Enter yes or no: " yn
      >   case $yn in
      >     [Yy]* ) echo "You entered yes. Ill ask again...";;
      >     [Nn]* ) exit;;
      >     * ) echo "Enter yes or no: ";;
      >   esac
      > }
      > done
      Are you ok? Enter yes or no: yes
      You entered yes. Ill ask again...
      Are you ok? Enter yes or no: yes
      You entered yes. Ill ask again...
      Are you ok? Enter yes or no: no
      logout
      Saving session...
      ...copying shared history...
      ...saving history...truncating history files...
      ...completed.

      [Process completed]
