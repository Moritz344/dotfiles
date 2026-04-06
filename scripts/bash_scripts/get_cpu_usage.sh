awk '
/^cpu / {
  idle=$5+$6
  total=$2+$3+$4+$5+$6+$7+$8+$9+$10
}
NR==1 { idle1=idle; total1=total; next }
{
  idle2=idle; total2=total
  printf " %.1f%%\n", (1-(idle2-idle1)/(total2-total1))*100
}
' <(grep '^cpu ' /proc/stat; sleep 1; grep '^cpu ' /proc/stat)

