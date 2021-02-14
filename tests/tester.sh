#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

total=0
success=0

BLUE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[1;32m'
DARK_GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

pass() {
  local string=$1
  let "total = total + 1"
  let "success = success + 1"
  echo -e "  ${GREEN}$string ✓${NC}"
}

fail() {
  local string=$1
  let "total = total + 1"
  echo -e "  ${RED}$string ✗${NC}"
}


echo -e "Run: ${BLUE}script.sh https://www.ovnicap.com/ start Dig${NC}"

output=$(../script.sh https://www.ovnicap.com/ start Dig)
exitCode="$?"

assertion="it should exit with 0 code"

if [[ "$exitCode" == "0" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi

assertion="it should output only [Digital]"

if [[ $output == "[Digital]" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi


echo -e "Run: ${BLUE}script.sh http://www.ovnicap.com/ start Dig${NC}"

output=$(../script.sh http://www.ovnicap.com/ start Dig)
exitCode="$?"

assertion="it should exit with 0 code"

if [[ "$exitCode" == "0" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi

assertion="it should output only [Digital]"

if [[ $output == "[Digital]" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi


echo -e "Run: ${BLUE}script.sh https://www.ovnicap.com/blog/limoges-ingenieur-systeme-et-reseaux-confirme start Li${NC}"

output=$(../script.sh https://www.ovnicap.com/blog/limoges-ingenieur-systeme-et-reseaux-confirme start Li)
exitCode="$?"

assertion="it should exit with 0 code"

if [[ "$exitCode" == "0" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi

assertion="it should contain [Limoges]"

if [[ $output =~ "[Limoges]" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi

assertion="it should contain [Linuxien]"

if [[ $output =~ "[Linuxien]" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi

assertion="it should contain [Linux]"

if [[ $output =~ "[Linux]" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi


echo -e "Run: ${BLUE}script.sh https://www.ovnicap.com/blog/limoges-ingenieur-systeme-et-reseaux-confirme end SQL${NC}"

output=$(../script.sh https://www.ovnicap.com/blog/limoges-ingenieur-systeme-et-reseaux-confirme end SQL)
exitCode="$?"

assertion="it should exit with 0 code"

if [[ "$exitCode" == "0" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi

assertion="it should contain [MySQL]"

if [[ $output =~ "[MySQL]" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi

assertion="it should contain [PostgreSQL]"

if [[ $output =~ "[PostgreSQL]" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi

assertion="it should contain only once [MySQL] then [PostgreSQL]"
output=`echo $output | sed -e 's/[[:blank:]]//g'`

if [[ $output == "[MySQL][PostgreSQL]" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi


echo -e "Run: ${BLUE}script.sh https://www.ovnicap.com/blog/limoges-ingenieur-systeme-et-reseaux-confirme end SQL${NC}"

output=$(../script.sh https://www.ovnicap.com/blog/limoges-ingenieur-systeme-et-reseaux-confirme middle SQL)
exitCode="$?"

assertion="it should exit with 1 code"

if [[ "$exitCode" == "1" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi

assertion="it should output only Invalid command"

if [[ $output == "Invalid command" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi


echo -e "Run: ${BLUE}script.sh httpz://www.ovnicap.com/ middle SQL${NC}"

output=$(../script.sh httpz://www.ovnicap.com/ middle SQL)
exitCode="$?"

assertion="it should exit with 1 code"

if [[ "$exitCode" == "1" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi

assertion="it should output only Invalid URL"

if [[ $output == "Invalid URL" ]]; then
  pass "$assertion"
else
  fail "$assertion"
fi


let "percentage = 100 * success / total"

if [[ $percentage -gt 90 ]]; then
  echo -e "${GREEN}Score: $percentage%${NC}"
  exit 0
elif [[ $percentage -gt 60 ]]; then
  echo -e "${DARK_GREEN}Score: $percentage%${NC}"
  exit 0
elif [[ $percentage -gt 30 ]]; then
  echo -e "${YELLOW}Score: $percentage%${NC}"
  exit 1
else
  echo -e "${RED}Score: $percentage%${NC}"
  exit 1
fi;
