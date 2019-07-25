reproduce :
	touch images/s5-files.svg
	eog images/

GDKPID=$(shell pgrep --newest --full /usr/bin/gdk-pixbuf-thumbnailer)
TIMESTAMP=$(shell date +%s)
strace-gdk :
	strace -o strace_$(TIMESTAMP).log -twTCp $(GDKPID)
	# -o: Path to output log file.
	# -t: Prefix each line of the trace with the wall clock time.
	# -w: Show wall clock time in summary
	# -T: Show time spent in actual syscall
	# -C: Summarize and print regular output
