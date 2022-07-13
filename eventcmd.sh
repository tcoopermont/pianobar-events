#todo: test ability to pass environment variable RECORD FOLDER - should be able to just use dirname on 
# full path retrieved from proc environment
# do a check for bad proccess id or bad filename


rec_pid=`cat "${XDG_HOME_CONFIG:-${HOME}/.config}/pianobar/record_pid"`
if [ $? -ne 0 ]
then
	echo "process id not found"
	exit 2
fi
echo record process: $rec_pid

case "$1" in
	songfinish)

		#arecord open file descriptor, others were NULL
		proc_last_file=`readlink /proc/$rec_pid/fd/3`
		if [ ! -f proc_last_file ]
		then
			echo could not retrieve wav file name from /proc
			exit 2
		fi
		echo current file: $proc_last_file 
		kill -s SIGUSR1 $rec_pid
		path=$(dirname $proc_current_file)
		#fix titlename - use new function
		#fixed_title=`echo -n $title | tr [:space:] - | tr  /\' -`
		mv $proc_last_file "$path/$fixed_title.wav"
		
		echo "$title -- $artist" > "${XDG_HOME_CONFIG:-${HOME}/.config}/pianobar/nowplaying"
		
		
		
