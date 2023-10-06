for ntests in 1000 10000 100000 1000000 10000000;
do
	for tcount in 1 2 4 8 16;
	do
		echo "Running $ntests tests with $tcount threads"
		echo 
		echo "$ntests" | make MPI=true THREAD_COUNT=$tcount run
		echo
		echo "========== COMPLETE =========="
		echo
	done
done
