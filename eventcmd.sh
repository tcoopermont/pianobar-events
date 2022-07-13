#todo: test ability to pass environment variable RECORD FOLDER - should be able to just use dirname on 
# full path retrieved from proc environment


rec_pid=`cat "${XDG_HOME_CONFIG:-${HOME}/.config}/pianobar/record_pid"`
echo record process: $rec_pid

case "$1" in
	songfinish)

		
		proc_last_file=`readlink /proc/$rec_pid/fd/3`
		echo current file: $proc_last_file 
		kill -s SIGUSR1 $rec_pid
		path=$(dirname $proc_current_file)
		#fix titlename - use new function
		#fixed_title=`echo -n $title | tr [:space:] - | tr  /\' -`
		mv $proc_last_file "$path/$fixed_title.wav"
		
		echo "$title -- $artist" > "${XDG_HOME_CONFIG:-${HOME}/.config}/pianobar/nowplaying"
		
		
		
