for IP in  `cat -`; do 
        EMAIL=`whois -h marvin.funkfeuer.at  $IP| grep email| cut -d ":" -f 2`;
        echo $IP, $EMAIL
        done
