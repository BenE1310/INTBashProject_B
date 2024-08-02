# .bash_profile


# Print Hello when a user logged in.
currentUser=$(id -un)
echo Hello $currentUser && echo ""
# COURSE_ID equals to DevOpsTheHardWay
export CUORSE_ID=DevOpsTheHardWay

#.token existing and permission checking
if [ -f /home/$currentUser/.token ]; then
  filePermission=$(stat -c "%a" /home/$currentUser/.token)
  if [ $filePermission != "600" ]; then
    echo Warning: .token file has too open permissions & echo ""
  fi
fi

#change default umask
umask 0060

#Add usercommands folder to Enviroment Variables
PATH=$PATH:/home/$currentUser/usercommands

#Printing the current date and time in ISO 8601 format
UTCdate=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
echo The current date is: $UTCdate && echo ""

#Alias ls txt file
alias ltxt="ls *.txt"

# ~/tmp folder
if [ ! -f ~/tmp ]; then
  mkdir ~/tmp && echo Folder ~/tmp was created.
else
  rm  -rf ~/tmp/*
fi

#kill process that bound to port 8080
PORT=3389
PID=$(lsof -t -i:$PORT)

if [ -n "$PID" ]; then
  echo "Killing process $PID bound to port $PORT"
  kill -9 $PID
else
  echo "No process is bound to port $PORT"
fi