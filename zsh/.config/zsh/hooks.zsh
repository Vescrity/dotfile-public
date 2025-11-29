local tmppt=$(lsblk | grep /tmp | head -c4)
if [[ "$tmppt" != zram ]] ; then
    notify-send 'BUG!!' '/tmp is not ZRAM!!'
fi
