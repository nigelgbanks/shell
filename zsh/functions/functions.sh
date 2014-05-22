search () {
    find . -regex ".*\.\(php\|inc\|test\|module\|install\|info\)" -exec grep -H $@ {} \;
}
mecp () {
    scp $@ ${SSH_CLIENT%% *}:~/Downloads;
}
find_and_replace() {
    search $1 | cut -d ":" -f 1 | xargs perl -i -p -e "s/$1/$2/g"
}
up(){
  if [ -z $1 ]
  then
    cd ..
    return
  fi
  local levels=$1
  local result="."
  while [ $levels -gt 0 ]
  do
    result=$result/..
    ((levels--))
  done
  cd $result
}
upto(){
  if [ -z $1 ]; then
      echo "Usage: upto [directory]"
      return 1
  fi
  local upto=$1
  cd "${PWD/\/$upto\/*//$upto}"
}
downto(){
  if [ -z $1 ]; then
      echo "Usage: downto [directory]";
      return 1
  else
      cd **/$1
  fi
}
checkstyle() {
    echo $1
    java -jar ~/.config/java/checkstyle-5.6-all.jar $1
}
