config_file=/config/inadyn.conf

if [[ ! -f $config_file ]]; then

    echo "update_period_sec 600" > $config_file
    echo "username ${USERNAME}" >> $config_file
    echo "password ${PASSWORD}" >> $config_file
    
    if [ -z "$system" ]; then

        echo "default@dyndns.org" >> $config_file

    else

        echo "system ${SYSTEM}" >> $config_file

    fi

else

    inadyn --input_file $config_file

fi