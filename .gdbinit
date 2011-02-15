set history filename ~/.gdb.hist
set history save on

define wp
	echo "

  set $i = 0
  while (1 == 1)
  	set $c = (char)(($arg0)[$i++])
    if ($c == '\0')
    	loop_break
    end
    printf "%c", $c
  end

  echo "
end

define lbr
     source ~/.gdb.breaks
end

define sbr
     shell echo > ~/.gdb.br_log
     set logging file ~/.gdb.br_log
     set logging on
     info b
     set logging off
     shell cat ~/.gdb.br_log | grep ' at ' | sed 's/.* at /b /' >  ~/.gdb.breaks
end
