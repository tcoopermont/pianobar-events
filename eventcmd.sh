#todo: test ability to pass environment variable RECORD FOLDER - should be able to just use basename on 
# full path retrieved from proc environment

new_proc=-11
last_file=unknown_file
last_title=unknown_title
last_title=`cat "${XDG_HOME_CONFIG:-${HOME}/.config}/pianobar/last_title"`
rec_pid=`cat "${XDG_HOME_CONFIG:-${HOME}/.config}/pianobar/record_pid"`
echo last title: $last_title

case "$1" in
	songfinish)

		last_file=`ls -t1  /home/debian/thesmiths/test*wav | head -1`
		proc_current_file=`readlink /proc/$rec_pid/fd/3`
		echo last: $last_file
		echo last proc: $proc_current_file 
		kill -s SIGUSR1 $rec_pid 
		mv $last_file "/home/debian/thesmiths/$last_title.wav"
		
		echo "$title -- $artist" > "${XDG_HOME_CONFIG:-${HOME}/.config}/pianobar/nowplaying"
		tr_title=`echo -n $title | tr [:space:] - | tr  /\' -`
		echo "$tr_title" > "${XDG_HOME_CONFIG:-${HOME}/.config}/pianobar/last_title"
		
