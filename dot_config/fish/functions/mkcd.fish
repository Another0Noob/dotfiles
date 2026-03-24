function mkcd
    if test -n "$argv"
        mkdir $argv
        cd $argv
    else
        echo "mkcd: missing operand"
        return 1
    end
end
